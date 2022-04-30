#!/usr/bin/env sh

set -eux

docker-compose exec -- \
	mariadb mysqldump -uiori_user -ppassword --all-databases \
	| gzip -9
	> mariadb-bak-$(date -Ins).sql.gz
