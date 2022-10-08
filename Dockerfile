FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y
RUN apt upgrade -y

RUN apt install -y iputils-ping
RUN apt install -y net-tools
RUN apt install -y systemctl
RUN apt install  -y vim
RUN apt install -y snmpd 
RUN systemctl enable snmpd
RUN apt install -y apache2
RUN apt install -y apache2-utils 

COPY ./website/ /usr/local/apache2/htdocs/
COPY ./website/ /var/www/html/

EXPOSE 80
CMD [ "apache2ctl", "-D", "FOREGROUND" ]
