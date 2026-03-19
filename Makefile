all : build up

ci: env-ci build-ci up-ci

up :
	mkdir -p $${HOME}/data/db
	mkdir -p $${HOME}/data/wordpress
	docker compose --project-directory ./srcs up -d

up-ci:
	mkdir -p $${HOME}/data/db
	mkdir -p $${HOME}/data/wordpress 
	docker compose -f ./srcs/docker-compose.yml -f ./srcs/docker-compose.ci.yml up -d

build:
	docker compose --project-directory ./srcs build

wait-ci:
	bash ./scripts/wait_for_stack.sh

logs-ci:
	docker compose -f srcs/docker-compose.yml -f srcs/docker-compose.ci.yml logs

build-ci:
	docker compose -f ./srcs/docker-compose.yml -f ./srcs/docker-compose.ci.yml build

print :
	docker images -aq

env-ci:
	bash ./scripts/env_templating.sh ./srcs/.env.example

stop:
	docker compose --project-directory ./srcs stop

rm: stop
	docker compose --project-directory ./srcs rm -f

clean :
	-docker rm -f $$(docker ps -aq)

fclean : clean
	-docker rmi -f $$(docker images -aq)

prune : fclean
	-docker volume rm $$(docker volume ls -q)

re: prune all

.PHONY: all up clean fclean build stop rm print prune
