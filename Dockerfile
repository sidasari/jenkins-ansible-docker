FROM centos
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install java

CMD /bin/bash
RUN yum install -y httpd \
zip \
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page41/pride-and-prejudice.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip pride-and-prejudice.zip
RUN cp -rvf pride-and-prejudice/* .
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
