From centos:latest
RUN yum install -y httpd zip unzip
ADD https://www.free-css.com/free-css-templates/download/page247/kindle.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip kindle.zip
RUN cp -rvf markups-kindle/* .
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80