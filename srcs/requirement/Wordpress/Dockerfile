FROM alpine:3.16

RUN apk add --no-cache php-fpm php curl php-common php-mbstring php-bz2

# Wordpress installation : we use wp-cli to automate site installation
# download
ARG WP_PATH

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN echo hello ${WP_PATH} > test.lol
#RUN wp --allow-root core download --path=${WP_PATH} --locale=fr_FR

#RUN wp --allow-root config create --path=${WP_PATH}  --dbhost=${DB_HOST}\
#	--dbname=${DB_NAME} --dbuser=${DB_USERNAME} --dbpass=${DB_PASSWORD}

#RUN service mysql start &&\
#	wp --allow-root --path=${WP_PATH} db create


#RUN service mysql start &&\
#	wp --allow-root --path=${WP_PATH} core install \
#	--url=localhost/wordpress/ --title=ft_wordpress \
#	--admin_user=${WP_USER} --admin_password=${WP_PASS} \
#	--admin_email=${WP_MAIL} --skip-email

CMD ["php-fpm8", "-F"]
