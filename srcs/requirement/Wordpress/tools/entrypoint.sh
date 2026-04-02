#!/bin/sh


sh /root/tools/install_wp.sh

#if ! ls /var/www/wordpress | grep ".*" > /dev/null
#then
#	cp -r /root/wordpress/* /var/www/wordpress
#fi

#cp -R /root/conf/redis-cache /var/www/wordpress/wp-content/plugins/redis-cache
#cp /root/conf/object-cache.php /var/www/wordpress/wp-content/object-cache.php

chown -R nobody:nobody /var/www/wordpress
chmod -R 700 /var/www/wordpress

exec php-fpm8 -F
