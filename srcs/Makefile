all : build up

up :
	sudo docker compose up -d --build

build:
	sudo docker compose build

print :
	sudo docker images -aq

stop:
	sudo docker compose stop

rm:
	sudo docker compose rm

clean :
	-sudo docker rm -f $$(sudo docker ps -aq)

fclean : clean
	-sudo docker rmi -f $$(sudo docker images -aq)

re: fclean all

.PHONY: all up clean fclean build
