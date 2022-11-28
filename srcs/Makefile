all : build up

up :
	docker compose up -d

build:
	docker compose build

print :
	docker images -aq

stop:
	docker compose stop

rm:
	docker compose rm

clean :
	-docker rm $(docker ps -aq)

fclean : clean
	-docker rmi $(docker images -aq)

re: fclean all

.PHONY: all up clean fclean build
