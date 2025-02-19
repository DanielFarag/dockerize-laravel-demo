#!/bin/sh

cp .env.example .env

php artisan key:generate

while ! php artisan migrate --force --seed; do
    echo "Migration failed! Retrying in 5 seconds..."
    sleep 5
done


# Start PHP-FPM in foreground mode
exec php-fpm -F