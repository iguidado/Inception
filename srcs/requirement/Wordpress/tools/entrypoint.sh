#!/bin/sh

if ! ls /var/www/wordpress | grep ".*" > /dev/null
then
	cp -r /root/wordpress/* /var/www/wordpress
fi

chown -R nobody:nobody /var/www/wordpress

php-fpm8 -F
