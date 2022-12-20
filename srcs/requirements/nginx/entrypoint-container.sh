#!/bin/bash

#Run NGINX
nginx -g "daemon off;"


tail -f /var/log/nginx/access.log /var/log/nginx/error.log