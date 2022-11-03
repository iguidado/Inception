all : up

up :
	docker compose up

print:
	docker images -aq

clean :
	-docker rm $(docker ps -aq)

fclean : clean
	-docker rmi $(docker images -aq)

re: fclean all

.PHONY: all up clean fclean
