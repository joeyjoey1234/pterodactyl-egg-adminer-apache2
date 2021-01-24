FROM ubuntu:latest



RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt-get update
RUN apt-get install dialog apt-utils -y



RUN apt-get -y dist-upgrade

RUN apt-get -y upgrade
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update --fix-missing
RUN apt-get install -y adminer
RUN apt-get install -y adminer 
RUN apt-get install -y snapd
RUN a2enmod ssl


RUN cp /etc/adminer/conf.php /var/www/html/

RUN rm /var/www/html/index.html

RUN cp /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled/

RUN rm /etc/apache2/sites-enabled/000-default.conf

RUN sed -i '5s\.*\		DocumentRoot /var/www/html/conf.php \' /etc/apache2/sites-enabled/default-ssl.conf


RUN sed -i '2s/.*/	DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm /' /etc/apache2/mods-enabled/dir.conf


EXPOSE 25565




