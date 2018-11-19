FROM ubuntu:16.04
MAINTAINER Sharique Masood <sharique.masood@tothenew.com>
RUN apt-get update -y && apt-get install -y software-properties-common openssh-server &&  LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php 
RUN apt-get update -y && apt-get install -y php5.6-fpm  php5.6-redis  php5.6-mysql php5.6-pgsql \ 
    php5.6-sqlite php5.6-curl php5.6-gd php5.6-mcrypt php5.6-intl php5.6-imap php5.6-tidy 
RUN mkdir /var/run/sshd &&  sed -i '72 a PasswordAuthentication yes' /etc/ssh/sshd_config &&  \
    sed -i 's/prohibit-password/yes/g'  /etc/ssh/sshd_config &&  echo "root:ttn" | chpasswd

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
EXPOSE 22
EXPOSE 80
EXPOSE 443

