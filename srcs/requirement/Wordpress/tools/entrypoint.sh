#!/bin/sh

if ! ls /var/www/wordpress | grep ".*" > /dev/null
then
	cp -r /root/wordpress/* /var/www/wordpress
fi

chown -R nobody:nobody /var/www/wordpress

tail -f /dev/null
#PHP=$(ls /bin | grep "php-fpm*")

#"${PHP}" -F
