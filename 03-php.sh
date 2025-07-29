#!/bin/bash
source ./00-env.sh

add-apt-repository ppa:ondrej/php -y
apt update
apt install -y php$PHP_VERSION php$PHP_VERSION-cli php$PHP_VERSION-fpm php$PHP_VERSION-pgsql php$PHP_VERSION-mbstring php$PHP_VERSION-xml php$PHP_VERSION-curl php$PHP_VERSION-bcmath php$PHP_VERSION-zip php$PHP_VERSION-mysql php$PHP_VERSION-sqlite3 php$PHP_VERSION-readline php$PHP_VERSION-gd php$PHP_VERSION-soap php$PHP_VERSION-intl

# Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
