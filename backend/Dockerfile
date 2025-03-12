FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git \
    libzip-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

COPY composer*.json .

RUN composer i --no-interaction --no-scripts

COPY . .

RUN composer run-script post-autoload-dump

RUN chown -R www-data:www-data ./storage  ./bootstrap/cache

EXPOSE 9000

RUN chmod +x migrate-fpm.sh

CMD ["./migrate-fpm.sh"]
