#!/bin/sh

while ! php artisan migrate --seed; do
    echo "Migration failed! Retrying in 5 seconds..."
    sleep 5
done


# Start PHP-FPM in foreground mode
exec php-fpm -F