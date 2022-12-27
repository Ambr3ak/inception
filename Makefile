CC 			= docker compose
RM			= rm -rf

SRCS		=	srcs/docker-compose.yml

_OK			= \033[32mOK\033[0m
_BOLD		= \033[1m


start		:
			mkdir -p /home/lambrette/data/wp
			mkdir -p /home/lambrette/data/db
			$(CC) -f $(SRCS) up -d --build

stop		:
			$(CC) -f $(SRCS) stop

clean		: stop
			$(CC) -f $(SRCS) down --volumes

fclean		: clean
			-docker system prune -af

re			: fclean start

.PHONY		: start stop clean fclean re