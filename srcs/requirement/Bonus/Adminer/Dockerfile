FROM alpine:3.18

RUN apk add --no-cache php-fpm wget php-common php-session php-mysqli

COPY ./tools /tools

RUN sed "s/127.0.0.1/0.0.0.0/" -i /etc/php8/php-fpm.d/www.conf

RUN echo "access.log = /proc/self/fd/2" >> /etc/php8/php-fpm.conf && \
sed -i "s:;error_log = .*:error_log = /proc/self/fd/2:" /etc/php8/php-fpm.conf

RUN chmod +x  /tools/entrypoint.sh

CMD ["/tools/entrypoint.sh"]
