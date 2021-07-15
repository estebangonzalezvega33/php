FROM composer:1.6.5 as build
LABEL authors="esteban gonzalez"

WORKDIR /app
COPY . /app
RUN composer install


#COPY webphp/web /var/www/html
#EXPOSE 80