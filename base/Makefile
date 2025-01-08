.PHONY: build

build:
	docker build . --no-cache --build-arg UID=$$(id -u $${USER}) --build-arg GID=$$(id -g $${USER}) -t dev-base
