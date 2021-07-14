FROM php:7.2.14-fpm
RUN apt-get update && apt-get install -y libmcrypt-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable imagick \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-install pdo_mysql
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
COPY webphp/web /var/www/html
EXPOSE 8080