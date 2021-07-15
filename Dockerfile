FROM php:7.2-fpm
LABEL authors="esteban gonzalez"

RUN apt update \
        && apt install -y \
            g++ \
            libicu-dev \
            libpq-dev \
            libzip-dev \
            zip \
            zlib1g-dev \
        && docker-php-ext-install \
            intl \
            opcache \
            pdo \
            pdo_pgsql \
            pgsql \
			
#COPY webphp/web /var/www/html
#EXPOSE 80