FROM ubuntu:16.04
MAINTAINER Sharique Masood <sharique.masood@tothenew.com>
RUN apt-get update -y && apt-get install -y software-properties-common openssh-server &&  LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php 
RUN apt-get update -y && apt-get install -y php7.2-fpm  php7.2-redis  php7.2-mysql php7.2-pgsql \ 
    php7.2-sqlite php7.2-curl php7.2-gd php7.2-intl php7.2-imap php7.2-tidy 
RUN mkdir /var/run/sshd &&  sed -i '72 a PasswordAuthentication yes' /etc/ssh/sshd_config &&  \
    sed -i 's/prohibit-password/yes/g'  /etc/ssh/sshd_config &&  echo "root:ttn" | chpasswd

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
EXPOSE 22
EXPOSE 80
EXPOSE 443

