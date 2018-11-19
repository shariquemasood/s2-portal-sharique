FROM ubuntu:16.04
MAINTAINER Sharique Masood <sharique.masood@tothenew.com>
ARG VERSION=5.6
RUN apt-get update -y && apt-get install -y software-properties-common openssh-server &&  LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php 
RUN apt-get update -y && apt-get install -y php${VERSION}-fpm  php${VERSION}-redis  php${VERSION}-mysql php${VERSION}-pgsql \ 
    php${VERSION}-sqlite php${VERSION}-curl php${VERSION}-gd php${VERSION}-intl php${VERSION}-imap php${VERSION}-tidy 
RUN mkdir /var/run/sshd &&  sed -i '72 a PasswordAuthentication yes' /etc/ssh/sshd_config &&  \
    sed -i 's/prohibit-password/yes/g'  /etc/ssh/sshd_config &&  echo "root:ttn" | chpasswd

COPY test.conf /etc/php/${VERSION}/fpm/pool.d/test.conf
COPY example-app-php /var/www/example-app-php

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
EXPOSE 22
EXPOSE 9000
