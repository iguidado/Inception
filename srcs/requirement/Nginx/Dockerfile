FROM alpine:3.16

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


# Web file should be owned by a user dedicated to avoid security issue
#RUN chown -R www-data:www-data /var/www/html

# Cleaning
#RUN rm -rf /root/srcs/script/
#run rm -rf /root/srcs/cfg/

CMD ["nginx", "-g", "daemon off;"]
