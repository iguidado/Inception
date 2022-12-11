FROM alpine:3.16

RUN apk add --no-cache php-fpm php php-phar wget php-common php-mbstring php-bz2 php-mysqli mariadb wget curl

ARG WORDPRESS_DB_HOST WORDPRESS_DB_USER WORDPRESS_DB_PASS WORDPRESS_DB_NAME WORDPRESS_TABLE_PREFIX

# Wordpress installation : we use wp-cli to automate site installation
# download
ARG WP_PATH=/var/www/wordpress

COPY tools/ /root/tools/
COPY conf/ /root/conf/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

#RUN mkdir -p /var/www/wordpress

#RUN wp --allow-root core download --path=${WP_PATH}

#RUN wp --allow-root --path=${WP_PATH} db create



RUN cp /root/conf/wp-config-sample.php /root/conf/wp-config.php && \
sed -i "s/wp_/${WORDPRESS_TABLE_PREFIX}/" /root/conf/wp-config.php && \
sed -i "s/localhost/${WORDPRESS_DB_HOST}/" /root/conf/wp-config.php &&\
sed -i "s/votre_nom_de_bdd/${WORDPRESS_DB_NAME}/" /root/conf/wp-config.php &&\
sed -i "s/votre_utilisateur_de_bdd/${WORDPRESS_DB_USER}/" /root/conf/wp-config.php &&\
sed -i "s/votre_mdp_de_bdd/${WORDPRESS_DB_PASS}/" /root/conf/wp-config.php

RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz -O - | zcat | tar x -C /root/

RUN cp /root/conf/wp-config.php /root/wordpress/

#RUN wp --allow-root --path=/root/wordpress core install \
#	--url=localhost/wordpress/ --title=ft_wordpress \
#	--admin_user=Marion --admin_password=Cotillard \
#	--admin_email=Ma.cotill@nulpar.con --skip-email

RUN sed "s/127.0.0.1/0.0.0.0/" -i /etc/php8/php-fpm.d/www.conf


#CMD cp -r /root/wordpress /var/www/wordpress && php-fpm8 -F

#CMD ["cp", "-r", "/root/wordpress/", "/var/www/wordpress", "&&", "php-fpm8", "-F"]
#CMD ["php-fpm8", "-F"]
CMD ["/root/tools/entrypoint.sh"]
