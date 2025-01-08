.PHONY: start stop

# dockerized ssh agent, to avoid copy of keys to all containers

ssh-private-key=id_ed25519

start:
	# create volume, build image with ssh-agent with ssh auth socket, run it and add provided key
	docker volume create --name ssh-agent
	docker build --build-arg UID=$$(id -u $${USER}) --build-arg GID=$$(id -g $${USER}) -t dev-ssh-agent:latest -f Dockerfile .
	docker run -d -v ssh-agent:/.ssh-agent --name=ssh-agent dev-ssh-agent:latest
	docker run --rm -v ssh-agent:/.ssh-agent -v ~/.ssh:/.ssh -it dev-ssh-agent:latest ssh-add $(ssh-private-key)

stop:
	docker stop ssh-agent || true
	docker rm ssh-agent || true
	docker volume rm ssh-agent  || true
	docker rmi dev-ssh-agent:latest
