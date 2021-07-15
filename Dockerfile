FROM composer:1.6.5 as build
LABEL authors="esteban gonzalez"

WORKDIR /app
COPY . /app
RUN composer install

FROM php:7.1.8-apache

EXPOSE 80
COPY --from=build /app /app
COPY vhost.conf /etc/apache2/sites-available/000-default.conf
RUN chown -R www-data:www-data /app \
    && a2enmod rewrite

#COPY webphp/web /var/www/html
#EXPOSE 80