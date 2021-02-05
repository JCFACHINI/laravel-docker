#!/bin/bash
apt-get update
apt-get -y install vim
apt install -y redis-server
/usr/bin/redis-server --daemonize yes
echo 'extension=redis.so' >> /usr/local/etc/php/php.ini-development
echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20170718/xdebug.so' >> /usr/local/etc/php/php.ini-development
echo 'zend_extension=xdebug.so' >> /usr/local/etc/php/php.ini-development
echo 'xdebug.client_host=host.docker.internal' >> /usr/local/etc/php/php.ini-development
echo 'xdebug.mode=debug' >> /usr/local/etc/php/php.ini-development
echo 'xdebug.start_with_request=yes' >> /usr/local/etc/php/php.ini-development
cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
pecl install xdebug
pecl install redis
apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo pgsql pdo_pgsql pdo_mysql mysqli
php -S 0.0.0.0:8090 -t public