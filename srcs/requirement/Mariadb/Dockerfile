FROM alpine:3.16

RUN apk add --no-cache mariadb mariadb-client openrc

RUN mkdir /run/openrc/ && touch /run/openrc/softlevel

RUN /usr/bin/mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

COPY ./tools/ /tools/

ARG DB_ADMIN DB_ADMIN_PASS

RUN chmod +x /tools/setup.sh && /tools/setup.sh

#RUN mysld_safe && mariadb -u root <<EOF
#	CREATE wp_db;
#	CREATE USER 'Leonardo'@'localhost' IDENTIFIED BY 'lololil';
#	GRANT ALL PRIVILEGES ON wp_db.* to 'Leonardo'@'localhost';
#	FLUSH PRIVILEGES;
#	quit
#EOF


#RUN mariadb < init.sql && killall -9 mysqld_safe

#RUN /etc/init.db/mariadb setup

EXPOSE 3306

#CMD ["/etc/bin/mysqld_safe", "--dir=/var/lib"]
CMD ["mysqld_safe"]
#CMD ["tail", "-f", "/dev/null"]
