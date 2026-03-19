all : build up

ci: env-ci build-ci up-ci

up :
	mkdir -p $${HOME}/data/db
	mkdir -p $${HOME}/data/wordpress
	sudo docker compose --project-directory ./srcs up -d

up-ci:
	mkdir -p $${HOME}/data/db
	mkdir -p $${HOME}/data/wordpress 
	sudo docker compose -f ./srcs/docker-compose.yml -f ./srcs/docker-compose.ci.yml up -d

build:
	sudo docker compose --project-directory ./srcs build

wait-ci:
	bash ./scripts/wait_for_stack.sh

build-ci:
	sudo docker compose -f ./srcs/docker-compose.yml -f ./srcs/docker-compose.ci.yml build

print :
	sudo docker images -aq

env-ci:
	bash ./scripts/env_templating.sh ./srcs/.env.example

stop:
	sudo docker compose --project-directory ./srcs stop

rm: stop
	sudo docker compose --project-directory ./srcs rm

clean :
	-sudo docker rm -f $$(sudo docker ps -aq)

fclean : clean
	-sudo docker rmi -f $$(sudo docker images -aq)

prune : fclean
	rm -r mkdir $${HOME}/data
	docker volume rm $$(docker volume ls -q)

re: prune all

.PHONY: all up clean fclean build stop rm print prune
