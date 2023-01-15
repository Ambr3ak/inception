#!/bin/bash

mkdir -p /var/www/wordpress
sleep 10
cd /var/www/wordpress

if [[ ! -f "wp-config.php" ]]
then
    wp core download --allow-root
    wp config create	--allow-root \
                        --dbname=$SQL_DATABASE \
                        --dbuser=$SQL_USER \
                        --dbpass=$SQL_PASSWORD \
                        --dbhost=mariadb:3306
    wp core install --allow-root \
                    --url=$URL \
                    --title=$TITLE \
                    --admin_user=$ADMIN_USER \
                    --admin_password=$ADMIN_PASSWORD \
                    --admin_email=$ADMIN_MAIL
    wp user create --allow-root user user@example.com --role=subscriber
    chown -R www-data:www-data /var/www/wordpress

fi

exec "$@"
