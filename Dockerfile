FROM centos
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install java

CMD /bin/bash
RUN yum install -y httpd \
zip \
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page41/nature.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip nature.zip
RUN cp -rvf nature/* .
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
