# Inception

# Requirement

- [ ] container Nginx with Tlsv1.2 or Tlsv1.3
 - [ ] Nginx should proxy php on container bellow
 - [ ] it is the entrypoint for stack on port 443


- [ ] container Wordpress + php-fpm

- [ ] container with MariaDB
	- [ ] 2 user on MariaDB

- [ ] 1 volume for website: it will be shared between wordpress and nginx container
- [ ] Second volume for Database it shall be exported from previous Mariadb installation
		Or copied from a previous container

- [ ] usage of --links or network:host is forbidden

- [ ] container should reste in case of crash

- [ ] Docker compose to orchestrate container

## Docker

### Docker-compose

---
## Nginx

Nginx is a web server application serving static file page (html, css, you name it).
It also double up as a reverse proxy permitting fancy operation like forwarding
request to php-server or other web server, load balancing, etc...

Configuration file provided will greatly change depending on system implementation.
Nginx configuration is split in 2 :
- first there is main configuration file hosting global configuration affecting
server. Usually it is repertoried as '/etc/nginx/nginx.conf'

- Linked to it there is virtual host configuration which will define configuration
of each website. It is whom will we modify to treat request to our website

Alpine implementation store virtual host configuration file in `/etc/nginx/http.d/`.

Default Alpine installation treat all request as 404 error (not found).

```
# This is a default site configuration which will simply return 404, preventing
# chance access to any other virtualhost.

server {
	listen 80 default_server;
	listen [::]:80 default_server;

	# Everything is a 404
	location / {
		return 404;
	}

	# You may need this to prevent return 404 recursion.
	location = /404.html {
		internal;
	}
}
```

Since Alpine nginx default configuration is lacking in functionality we will implement some more

Let's see basic virtual host config' entry

it is structured in blocks. Top blocks is server one.

```
server {

}
```

you should define a server block by website.

Nginx server should redirect php request to wordpress container on port 9000.
These request shall be treated by php-fpm service.

```

```

---

## Wordpress

Wordpress container will contain wordpress files (since it is a website) and php-fpm
server as said above.

## Mariadb

Mariadb shall be pre-configured with Wordpress databases, admin and user.

