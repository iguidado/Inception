#!/bin/sh

cp -r /root/wordpress /var/www/wordpress

#wp core install --allow-root \
#	--path=/var/www/wordpress --title=ft_wordpress --url=iguidado.42.fr \
#	--admin_user=Marion --admin_password=Cotillard \
#	--admin_email=Macotill@nulpar.com --skip-email

#if [ ! -d /var/www/wordpress/ ]
#then
#	echo "downloaded wordpress" > /root/manifest
#	wget https://fr.wordpress.org/latest-fr_FR.tar.gz -O - | zcat | tar x -C /var/www/wordpress/
#fi
#
#
#cp /root/conf/wp-config.php  /var/www/wordpress/wp-config.php
#
#if [ ! -f /var/www/wordpress/salt.php ]
#then
#	wget https://api.wordpress.org/secret-key/1.1/salt/ -O /var/www/wordpress/salt.php
#fi

php-fpm8 -F
