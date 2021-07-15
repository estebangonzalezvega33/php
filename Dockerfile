FROM php:7.2-apache
LABEL authors="esteban gonzalez"
RUN apt update
RUN apt install -y git 
RUN apt install -y zip 
WORKDIR /var/www/laravel_docker
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
WORKDIR /etc/apache2/sites-enabled/
RUN  rm 000-default.conf
COPY default.conf /etc/apache2/sites-enabled/
WORKDIR /var/www/laravel_docker
RUN  composer create-project laravel/laravel .
RUN chmod -R 777 /var/www/laravel_docker/storage
EXPOSE 80