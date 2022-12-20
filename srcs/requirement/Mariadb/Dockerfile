FROM alpine:3.16

RUN addgroup -S mysql && adduser -S -g mysql mysql

RUN apk add --no-cache mariadb mariadb-client openrc



RUN mkdir /run/openrc/ && touch /run/openrc/softlevel

ARG DB_NAME MARIADB_USER DB_ADMIN DB_ADMIN_PASS MARIADB_ROOT_PASS 



RUN sed "s/skip/#skip/" -i /etc/my.cnf.d/mariadb-server.cnf && \
	sed "s/127.0.0.1/0.0.0.0/" -i /etc/my.cnf.d/mariadb-server.cnf

#sed "s/#bin/bin/" -i /etc/my.cnf.d/mariadb-server.cnf

RUN /usr/bin/mariadb-install-db --datadir=/var/lib/mysql


RUN mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld
COPY ./tools/ /tools/

RUN chmod +x /tools/entrypoint.sh /tools/setup.sh

RUN chmod +x /tools/init.sh && /tools/init.sh

#COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
#RUN mysld_safe && mariadb -u root <<EOF
#	CREATE wp_db;
#	CREATE USER 'Leonardo'@'localhost' IDENTIFIED BY 'lololil';
#	GRANT ALL PRIVILEGES ON wp_db.* to 'Leonardo'@'localhost';
#	FLUSH PRIVILEGES;
#	quit
#EOF

#RUN mariadb < init.sql && killall -9 mysqld_safe

#RUN /etc/init.db/mariadb setup

#EXPOSE 3306

#CMD ["mysqld_safe", "--dir=/var/lib/mysql"]
#CMD ["tail", "-f", "/dev/null"]
#CMD ["mysqld", "--user=mysql"]
CMD ["./tools/entrypoint.sh"]
