CC 			= docker compose
RM			= rm -rf

SRCS		=	srcs/docker-compose.yml

_OK			= \033[32mOK\033[0m
_BOLD		= \033[1m


start		:
			$(CC) -f $(SRCS) up -d --build

stop		:
			$(CC) -f $(SRCS) stop

delete		:
			$(CC) $(SRCS) down -v

clean		:
			@$(RM) $(OBJS)

fclean		: 
			docker system prune -af

re			: fclean all

.PHONY		: start stop delete clean fclean re