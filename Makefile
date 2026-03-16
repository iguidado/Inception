all : build up

up :
	sudo docker compose --project-directory ./srcs up -d --build

build:
	sudo docker compose --project-directory ./srcs build



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
	docker volume rm $$(docker volume ls -q)

re: prune all

.PHONY: all up clean fclean build stop rm print prune