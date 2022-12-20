FROM debian:buster

RUN apt-get -y update && apt-get -y install sudo \
    nginx \
    libnss3-tools \
    curl \
    vim \
    openssl


RUN mkdir -p /var/run/nginx
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/inception.pem -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=ambre/CN=localhost"

RUN service nginx start
RUN nginx -t



COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./entrypoint-container.sh .


# EXPOSE 80 443
CMD [ "nginx", "-g", "daemon off;" ]