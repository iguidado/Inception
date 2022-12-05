FROM alpine:3.16

RUN apk add --no-cache php-fpm php php-phar curl php-common php-mbstring php-bz2 php-mysqli mariadb

# Wordpress installation : we use wp-cli to automate site installation
# download
ARG WP_PATH=/var/www/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/wordpress

RUN wp --allow-root core download --path=${WP_PATH}
#
RUN wp --allow-root config create --path=${WP_PATH}  --dbhost=${WORDPRESS_DB_HOST}\
	--dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASS}
#
RUN wp --allow-root --path=${WP_PATH} db create

RUN sed "s/127.0.0.1/0.0.0.0/" -i /etc/php8/php-fpm.d/www.conf


RUN 	wp --allow-root --path=${WP_PATH} core install \
	--url=iguidado.42.fr --title=ft_wordpress \
	--admin_user=${WORDPRESS_USER} --admin_password=${WORDPRESS_PASS} \
	--admin_email=iguidado@stud.42.fr --skip-email

CMD ["php-fpm8", "-F"]
