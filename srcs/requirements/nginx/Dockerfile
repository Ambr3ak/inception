FROM debian:buster

RUN apt-get -y update && apt-get -y install sudo \
    nginx \
    libnss3-tools \
    curl \
    vim

RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=abourdar.42.fr/UID=abourdar"
RUN mkdir -p /var/run/nginx
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./entrypoint-container.sh .


# EXPOSE 80 443
ENTRYPOINT ["bash", "entrypoint-container.sh"]