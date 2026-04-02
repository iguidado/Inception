#!/bin/bash

export WP_PATH="/var/www/wordpress"
#curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#chmod +x wp-cli.phar
#mv wp-cli.phar /usr/local/bin/wp
php -d memory_limit=256M $(which wp) --allow-root core download --path=${WP_PATH} --locale=fr_FR


echo "Creating configuration"
wp --allow-root config create --path=${WP_PATH} --dbhost=mariadb --dbname=${WORDPRESS_DB_NAME} \
	--dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASS}


echo "Creating db entry based on configuration"
wp --allow-root --path=${WP_PATH} db create


echo "Installing Wordpress"
wp --allow-root --path=${WP_PATH} core install \
	--url=localhost/wordpress/ --title=ft_wordpress \
	--admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} \
	--admin_email=${WP_ADMIN_MAIL} --skip-email