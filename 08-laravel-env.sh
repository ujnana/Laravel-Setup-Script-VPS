#!/bin/bash
source ./00-env.sh

cd $LARAVEL_DIR
cp .env.example .env
sed -i "s/DB_CONNECTION=.*/DB_CONNECTION=pgsql/" .env
sed -i "s/DB_HOST=.*/DB_HOST=127.0.0.1/" .env
sed -i "s/DB_PORT=.*/DB_PORT=5432/" .env
sed -i "s/DB_DATABASE=.*/DB_DATABASE=$DB_NAME/" .env
sed -i "s/DB_USERNAME=.*/DB_USERNAME=$DB_USER/" .env
sed -i "s/DB_PASSWORD=.*/DB_PASSWORD=$DB_PASS/" .env

php artisan key:generate
php artisan migrate
