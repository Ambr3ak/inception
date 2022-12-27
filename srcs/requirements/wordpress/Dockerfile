FROM debian:buster

RUN apt-get -y update && apt-get -y install wget

RUN apt-get install -y php7.3\
						php-fpm\
						php-mysql \
						mariadb-client

RUN mkdir -p /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
					
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/auto_conf.sh auto_conf.sh

EXPOSE 9000 3306
ENTRYPOINT [ "bash", "auto_conf.sh" ]