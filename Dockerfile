FROM php:7.0-apache
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd
COPY webphp/web /var/www/html
EXPOSE 80