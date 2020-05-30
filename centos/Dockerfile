FROM centos:7
LABEL maintainter="h-ueno2"

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 && \
    yum -y update

# install apache
RUN yum -y install httpd

# 起動時にapacheを起動するように設定
RUN systemctl enable httpd

# exec
CMD ["/sbin/init"]
