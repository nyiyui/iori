# TODO: fix this mess
FROM mediawiki-iori as mw

FROM nginx:alpine
COPY --from=mw /var/www/html /var/www/iori/w
COPY ./nginx.conf /etc/nginx/templates/iori.conf.template
COPY ./logo.ico /var/www/iori/favicon.ico
COPY ./logo.svg /var/www/iori/logo.svg
