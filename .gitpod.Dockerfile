FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

ENV DOCKER 1

ENV PHP_OPCACHE_ENABLE "on"
ENV PHP_DISPLAY_ERRORS "off"
ENV PHP_ERROR_REPORTING "4983"

# Install packages
USER root
RUN apt-get update \
 && apt-get install -y software-properties-common curl vim-tiny \
 && curl -s https://packagecloud.io/install/repositories/timble/web/script.deb.sh | bash \
 && apt-add-repository ppa:ondrej/php \
 && apt-get update \
 && apt-get install -y supervisor \
    nginx \
    php7.4-fpm php-apcu php7.4-curl php7.4-gd php-imagick php7.4-intl php7.4-json php7.4-mbstring php-mongodb php7.4-mysql php-oauth php-sodium php7.4-tidy php7.4-xml php-yaml php7.4-zip \
    mysql-client \
 && apt-get remove -y gnupg curl software-properties-common gnupg apt-transport-https \
 && curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && apt-get -y autoremove \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /usr/src/linux-headers*

# Create required directories and set file permissions
RUN mkdir -p /var/run/php

# Configure the services
COPY ./docker/supervisord /etc/supervisor/conf.d/
COPY ./docker/php/fpm.conf /etc/php/7.4/fpm/php-fpm.conf
COPY ./docker/nginx/default.conf /etc/nginx/sites-available/default