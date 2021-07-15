FROM ubuntu:20.04

LABEL authors="esteban gonzalez"

ENV DEBIAN_FRONTEND=noninteractive

ARG PHP_VERSION
ENV PHP_VERSION=$PHP_VERSION


# |--------------------------------------------------------------------------
# | Main PHP extensions
# |--------------------------------------------------------------------------
# |
# | Installs the main PHP extensions
# |

# Install php an other packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends gnupg \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu focal main" > /etc/apt/sources.list.d/ondrej-php.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4F4EA0AAE5267A6C \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        nano \
        sudo \
        iproute2 \
        openssh-client \
        procps \
        unzip \
        ca-certificates \
        curl \
        php${PHP_VERSION}-cli \
        php${PHP_VERSION}-curl \
        php${PHP_VERSION}-mbstring \
        php${PHP_VERSION}-opcache \
        php${PHP_VERSION}-readline \
        php${PHP_VERSION}-xml \
        php${PHP_VERSION}-zip \
    && if [ "${PHP_VERSION}" = "7.1" ] || [ "${PHP_VERSION}" = "7.2" ] || [ "${PHP_VERSION}" = "7.3" ] || [ "${PHP_VERSION}" = "7.4" ]; then apt-get install -y --no-install-recommends php${PHP_VERSION}-json; fi \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*








#FROM php:7.0-apache
#RUN apt-get update && apt-get install -y libmcrypt-dev \
#    mysql-client libmagickwand-dev --no-install-recommends \
#    && pecl install imagick \
#    && pecl install mcrypt-1.0.2 \
#    && docker-php-ext-enable imagick \
#    && docker-php-ext-enable mcrypt \
#    && docker-php-ext-install pdo_mysql
#RUN curl -sS https://getcomposer.org/installer | php
#RUN mv composer.phar /usr/local/bin/composer

#RUN apt-get update && apt-get install -y \
#    git \
#    curl \
#    libpng-dev \
#   libonig-dev \
#    libxml2-dev \
#    zip \
#    unzip
#RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd
#COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
#RUN composer create-project laravel/laravel example-app
#RUN cd example-app
#CMD php artisan serve 
#EXPOSE 8181
#COPY webphp/web /var/www/html
#EXPOSE 80