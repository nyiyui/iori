FROM mediawiki:stable-fpm

# ==PHP==

# ===php.ini===

COPY php.ini "$PHP_INI_DIR/conf.d/iori.ini"
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# ===Extensions===

# ====intl====

RUN apt-get -y update \
    && apt-get install -y libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

# ==MediaWiki==

ENV MEDIAWIKI_MAJOR_VERSION 1.37

COPY ./CommonSettings.php /var/www/html/CommonSettings.php

# ===Install TemplateStyles===
RUN set -eux; \
    deps="git"; \
    apt-get update; \
    apt-get install -y --no-install-recommends $deps; \
    git clone -b $(printf 'REL'; echo ${MEDIAWIKI_MAJOR_VERSION} | tr '.' '_') https://github.com/wikimedia/mediawiki-extensions-TemplateStyles.git /var/www/html/extensions/TemplateStyles; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $deps;

# ===Install UploadWizard===
RUN set -eux; \
    deps="git"; \
    apt-get update; \
    apt-get install -y --no-install-recommends $deps; \
    git clone -b $(printf 'REL'; echo ${MEDIAWIKI_MAJOR_VERSION} | tr '.' '_') https://github.com/wikimedia/mediawiki-extensions-UploadWizard.git /var/www/html/extensions/UploadWizard; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $deps;
