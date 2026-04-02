#!/bin/sh

#mariadb-install-db --datadir=/var/lib/mysql

sh /tools/setup.sh

chown -R mysql:mysql /var/lib/mysql

exec mysqld --user=mysql
