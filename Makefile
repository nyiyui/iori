all: build up

build:
	(cd ./mediawiki-iori; ./build.sh)
	docker-compose build

up:
	docker-compose up

.PHONY: build up
