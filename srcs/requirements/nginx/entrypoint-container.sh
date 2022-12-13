#!/bin/bash

#Run NGINX
nginx -g 'daemon off;'

service nginx start
nginx -t


tail -f /var/log/nginx/access.log /var/log/nginx/error.log