FROM php:8-fpm

ADD https://raw.githubusercontent.com/Stan-Gobien/DockerWebserverStack/cloud01/Docker-PHP-FPM/resolv.conf /etc/resolv.conf

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN IPE_GD_WITHOUTAVIF=1 && chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions gd gettext mysqli apcu exif mcrypt mbstring xml

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install ssmtp


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y zlib1g-dev libpng-dev libjpeg-dev
RUN docker-php-ext-configure gd --with-jpeg && docker-php-ext-install gd
