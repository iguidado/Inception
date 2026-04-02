#!/bin/sh

if [ ! -f /var/www/wordpress/adminer.php ]
then
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php -O /var/www/wordpress/adminer.php
fi

php-fpm8 -F
