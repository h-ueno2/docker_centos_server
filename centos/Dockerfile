FROM centos:7
LABEL maintainter="h-ueno2"

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum -y update

# install apache
RUN yum -y install httpd

# install php
RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    yum -y install --enablerepo=remi,remi-php73 php php-mbstring php-xml php-xmlrpc php-gd php-pdo php-pecl-mcrypt php-mysqlnd php-pecl-mysql
# php.iniの取得
COPY config/php.ini /etc/php.ini

# 起動時にapacheを起動するように設定
RUN systemctl enable httpd

# exec
CMD ["/sbin/init"]
