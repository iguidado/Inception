FROM alpine:3.16

	RUN apk add --no-cache mariadb mariadb-client openrc

RUN mkdir /run/openrc/ && touch /run/openrc/softlevel

ARG MARIADB_NAME MARIADB_USER MARIADB_PASS MARIADB_ADMIN MARIADB_ADMIN_PASS


#COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
#RUN sed "s/#bin/bin/" -i /etc/my.cnf.d/mariadb-server.cnf && \
#	sed "s/skip/#skip/" -i /etc/my.cnf.d/mariadb-server.cnf

RUN /usr/bin/mariadb-install-db --datadir=/var/lib/mysql


#RUN mkdir /run/mysqld && chown -R mysql:mysql /run/mysqld
#COPY ./tools/ /tools/

#RUN chmod +x /tools/setup.sh && /tools/setup.sh

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
CMD ["tail", "-f", "/dev/null"]
#CMD ["mysqld", "--user=mysql"]
