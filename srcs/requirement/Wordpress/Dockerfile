FROM alpine:3.16

RUN apk add --no-cache php-fpm php php-phar php-common php-mbstring php-bz2 php-mysqli mariadb wget curl

ARG WORDPRESS_DB_HOST WORDPRESS_DB_USER WORDPRESS_DB_PASS WORDPRESS_DB_NAME WORDPRESS_TABLE_PREFIX

# Wordpress installation : we use wp-cli to automate site installation
# download
ARG WP_PATH=/var/www/wordpress

COPY tools/ /root/tools/
COPY conf/ /root/conf/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

RUN cp /root/conf/wp-config-sample.php /root/conf/wp-config.php && \
sed -i "s/wp_/${WORDPRESS_TABLE_PREFIX}/" /root/conf/wp-config.php && \
sed -i "s/localhost/${WORDPRESS_DB_HOST}/" /root/conf/wp-config.php &&\
sed -i "s/votre_nom_de_bdd/${WORDPRESS_DB_NAME}/" /root/conf/wp-config.php &&\
sed -i "s/votre_utilisateur_de_bdd/${WORDPRESS_DB_USER}/" /root/conf/wp-config.php &&\
sed -i "s/votre_mdp_de_bdd/${WORDPRESS_DB_PASS}/" /root/conf/wp-config.php &&\
sed -i "s/HOST_REDIS/${WORDPRESS_REDIS_HOST}/" /root/conf/wp-config.php

RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz -O - | zcat | tar x -C /root/

RUN cp /root/conf/wp-config.php /root/wordpress/

RUN sed "s/127.0.0.1/0.0.0.0/" -i /etc/php8/php-fpm.d/www.conf

RUN echo "access.log = /proc/self/fd/2" >> /etc/php8/php-fpm.conf && \
sed -i "s:;error_log = .*:error_log = /proc/self/fd/2:" /etc/php8/php-fpm.conf

CMD ["/root/tools/entrypoint.sh"]
