FROM php:7.0-apache
LABEL authors="esteban gonzalez"

#RUN apt update \
#        && apt install -y \
#            g++ \
#            libicu-dev \
#            libpq-dev \
#            libzip-dev \
#            zip \
#            zlib1g-dev \
#        && docker-php-ext-install \
#            intl \
#            opcache \
#            pdo \
#            pdo_pgsql \
#            pgsql \
#WORKDIR /var/www/laravel_docker
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
#WORKDIR /etc/apache2/sites-enabled/
#COPY default.conf /etc/apache2/sites-enabled/
COPY webphp/web /var/www/html
EXPOSE 80