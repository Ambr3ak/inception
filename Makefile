CC 			= -docker compose
RM			= rm -rf

SRCS		=	srcs/docker-compose.yml

_OK			= \033[32mOK\033[0m
_BOLD		= \033[1m


start		:
			$(CC) -f $(SRCS) up -d --build

stop		:
			$(CC) -f $(SRCS) stop

clean		: stop
			$(CC) -f $(SRCS) down --volumes --remove-orphans

fclean		: clean
			-docker system prune -af --volumes 2> /dev/null

re			: fclean all

.PHONY		: start stop clean fclean re