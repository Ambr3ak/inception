sleep 10
wp config create	--allow-root \
                    --dbname=$SQL_DATABASE \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_PASSWORD \
wp core install --url=abourdar.42.fr --title=MySite --admin_user=supervisor --admin_password=strongpassword --admin_email=sup@example.com
