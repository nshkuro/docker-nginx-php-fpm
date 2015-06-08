FROM debian:jessie

# Install packages
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y supervisor nano curl wget build-essential python-software-properties

# nginx
RUN apt-get install -y nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# php
RUN apt-get install -y \
  php5-fpm \
  php5-mysql \
  php5-mcrypt \
  php5-gd \
  php5-curl

# create required directories
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /etc/nginx
RUN mkdir -p /var/run/php5-fpm

ADD conf/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD conf/php/php.ini /etc/php5/fpm/conf.d/40-custom.ini
ADD sites/default.vhost /etc/nginx/sites-enabled/default.vhost

# expose volumes
VOLUME ["/var/www"]

EXPOSE 80 443 9000

CMD ["/usr/bin/supervisord"]