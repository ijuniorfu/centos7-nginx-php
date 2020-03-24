FROM centos:7

MAINTAINER ijuniorfu@gmail.com

RUN yum clean all && \
yum makecache && \
yum update -y && \
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
yum -y install openssl openssl-devel libmcrypt libmcrypt-devel && \
yum install -y nginx && \
yum -y install php72w php72w-pdo php72w-soap php72w-opcache php72w-mcrypt php72w-mbstring php72w-gd php72w-fpm php72w-cli php72w-mysqlnd php72w-pear php72w-pecl-imagick php72w-pecl-imagick-devel php72w-pecl-redis php72w-pecl-mongodb php72w-pecl-memcached php72w-imap php72w-devel php72w-bcmath php72w-pecl-apcu php72w-pecl-apcu-devel php72w-pecl-igbinary

RUN  localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 && \
echo "export LANG=zh_CN.UTF-8" >> /etc/profile && \
echo "export LC_ALL=zh_CN.UTF-8" >> /etc/profile && \
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
yum -y install git && \
yum -y install wget && \
yum -y install tar && \
yum -y install telnet && \
yum -y install net-tools && \
yum -y install crontabs && \
yum -y install supervisor

ENV LANG zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

WORKDIR /

CMD ["/usr/sbin/init"]
