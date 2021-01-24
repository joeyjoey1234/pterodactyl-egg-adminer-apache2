FROM ubuntu:latest



RUN printf '#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d
RUN apt-get update
RUN apt-get install dialog apt-utils -y



RUN apt-get -y dist-upgrade

RUN apt-get -y upgrade
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update --fix-missing
RUN apt-get install -y adminer
RUN apt-get install python3-certbot-apache
RUN a2enmod ssl



USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]



