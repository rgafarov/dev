.PHONY: init build

init:
	{ printf "UID="; eval "id -u $$USER"; printf "\r"; printf "GID="; eval "id -g $$USER"; printf "ARC="; eval "uname -m"; } > .env

build:
	docker compose build --no-cache

clean_images:
	docker rm -v $$(docker ps -a -q -f status=exited) || true
	docker rmi $$(docker images -f "dangling=true" -q) || true
