FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./entrypoint-container.sh .
ENTRYPOINT ["bash", "./entrypoint-container.sh"]

CMD ["mysqld_safe"]