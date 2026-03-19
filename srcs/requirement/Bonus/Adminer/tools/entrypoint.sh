#!/bin/sh

if [ ! -f /var/www/wordpress/adminer.php ]
then
	wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php -o /var/www/wordpress/adminer.php
fi


tail -f /dev/null

#PHP=$(ls /bin | grep "php-fpm*")

#"${PHP}" -F