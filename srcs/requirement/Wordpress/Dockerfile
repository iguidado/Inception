FROM alpine:3.16

RUN apk add --no-cache php-fpm php php-phar wget php-common php-mbstring php-bz2 php-mysqli mariadb #curl

# Wordpress installation : we use wp-cli to automate site installation
# download
ARG WP_PATH=/var/www/wordpress

COPY tools/ /root/tools/
COPY conf/ /root/conf/

#RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#
#RUN chmod +x wp-cli.phar
#
#RUN mv wp-cli.phar /usr/local/bin/wp
#
#RUN mkdir -p /var/www/wordpress

#RUN wp --allow-root core download --path=${WP_PATH}

#RUN wp --allow-root --path=${WP_PATH} db create

RUN sed "s/127.0.0.1/0.0.0.0/" -i /etc/php8/php-fpm.d/www.conf


CMD ["/root/tools/entrypoint.sh"]
