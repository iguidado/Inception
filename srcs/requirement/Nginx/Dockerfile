FROM alpine:3.23

ARG DEBIAN_FRONTEND=noninteractive

ARG AUTO_INDEX=on

RUN apk update && apk add --no-cache nginx openssl

#------------------------------------------------------------------------------

#RUN echo -e "<?php\nphpinfo();" > /var/www/html/index.php

#RUN chmod +x /root/srcs/scripts/autoindex.sh &&\
#	./root/srcs/scripts/autoindex.sh $AUTO_INDEX

#Generate ssl certificate
RUN openssl req -x509 -nodes -days 36500 -newkey rsa:2048\
	-keyout /etc/ssl/private.key -out /etc/ssl/certs.crt\
	-subj '/CN=localhost'
#------------------------------------------------------------------------------

RUN  ln -s /dev/stdout /var/log/nginx/access.log && ln -s /dev/stderr /var/log/nginx/error.log 

COPY conf/default.conf /etc/nginx/http.d/

# Web file should be owned by a user dedicated to avoid security issue
RUN mkdir -p /var/www/wordpress/ && chown -R nginx:nginx /var/www/wordpress && chmod -R 660 /var/www/wordpress

CMD ["nginx", "-g", "daemon off;"]
