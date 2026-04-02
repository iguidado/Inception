all : build up

up :
	sudo docker compose --project-directory ./srcs up -d

build:
	mkdir -p /home/lambda/data/db
	mkdir -p /home/lambda/data/wordpress
	sudo docker compose --project-directory ./srcs build

print :
	sudo docker images -aq

stop:
	sudo docker compose --project-directory ./srcs stop

rm: stop
	sudo docker compose --project-directory ./srcs rm

clean :
	-sudo docker rm -f $$(sudo docker ps -aq)

fclean : clean
	-sudo docker rmi -f $$(sudo docker images -aq)

purge : fclean
	-sudo rm -rf /home/lambda/data
	-docker volume rm $$(docker volume ls -q)

re: purge all

.PHONY: all up clean fclean build stop rm print purge
