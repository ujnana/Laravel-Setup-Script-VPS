#!/bin/bash
source ./00-env.sh

cd /var/www
composer create-project laravel/laravel laravel
cd $LARAVEL_DIR
composer require laravel/octane
php artisan octane:install --server=swoole
composer require predis/predis
chown -R www-data:www-data $LARAVEL_DIR
chmod -R 755 $LARAVEL_DIR
