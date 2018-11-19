FROM ubuntu:16.04
MAINTAINER Sharique Masood <sharique.masood@tothenew.com>
RUN apt-get update -y && apt-get install -y nginx

COPY test.com  /etc/nginx/sites-enabled/test.com
COPY example-app-php /var/www/example-app-php 
ENTRYPOINT  ["/usr/sbin/nginx", "-g", "daemon off;"]

EXPOSE 80 443
#
