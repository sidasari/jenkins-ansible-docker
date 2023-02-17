FROM ubuntu:latest
RUN  apt install apache2
WORKDIR /var/www/html
EXPOSE 80
