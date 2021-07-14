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
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer create-project laravel/laravel example-app
RUN cd example-app
CMD php artisan serve --host=0.0.0.0 --port=8181
#EXPOSE 8181
#COPY webphp/web /var/www/html
EXPOSE 8181