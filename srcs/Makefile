all : build up

up :
	sudo docker compose up -d

build:
	sudo docker compose build

print :
	docker images -aq

stop:
	docker compose stop

rm:
	docker compose rm

clean :
	-docker rm -f $$(docker ps -aq)

fclean : clean
	-docker rmi -f $$(docker images -aq)

re: fclean all

.PHONY: all up clean fclean build
