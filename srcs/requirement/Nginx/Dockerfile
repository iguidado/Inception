FROM alpine:3.24

ARG DEBIAN_FRONTEND=noninteractive

ARG AUTO_INDEX=on

RUN apk update && apk add --no-cache nginx openssl

#------------------------------------------------------------------------------


#Generate ssl certificate
RUN openssl req -x509 -nodes -days 36500 -newkey rsa:2048\
	-keyout /etc/ssl/private.key -out /etc/ssl/certs.crt\
	-subj '/CN=localhost'
#------------------------------------------------------------------------------

RUN  ln -s /dev/stdout /var/log/nginx/access.log && ln -s /dev/stderr /var/log/nginx/error.log 

RUN sed -i "s/user nginx/user nobody/" /etc/nginx/nginx.conf

RUN chown -R nobody:nobody /var/lib/nginx

COPY conf/default.conf /etc/nginx/http.d/

# Web file should be owned by a user dedicated to avoid security issue
RUN mkdir -p /var/www/wordpress/ && chown -R nginx:nginx /var/www/wordpress && chmod -R 660 /var/www/wordpress

CMD ["nginx", "-g", "daemon off;"]
