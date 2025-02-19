FROM php:8.2-fpm

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    git \
    libzip-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql zip

# # Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# # Set working directory
WORKDIR /var/www/html

# # Copy laravel project
COPY . /var/www/html

# # set writable permision [ storage, cache ]
RUN chown -R www-data:www-data /var/www/html/storage  /var/www/html/bootstrap/cache

# # Install project dependencies using Composer
# RUN rm -rf vendor composer.lock
# RUN composer i --no-interaction --no-cache
RUN composer i --no-interaction
RUN composer dumpautoload

# # Expose PHP-FPM port
EXPOSE 9000

# # Copy migrate-fpm script to wait for MySQL to be ready
COPY migrate-fpm.sh /usr/local/bin/migrate-fpm.sh

# # Make sure migrate-fpm.sh is executable
RUN chmod +x /usr/local/bin/migrate-fpm.sh

# ensure migration + start fpm
CMD ["/usr/local/bin/migrate-fpm.sh"]
