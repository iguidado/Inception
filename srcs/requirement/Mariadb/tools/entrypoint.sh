#!/bin/sh

if [ ! $(ls /var/lib/mysql | grep ".*") ]
then
	touch /root/proof.proof
#chown -R mysql:mysql /var/lib/mysql
#chmod 777 /var/lib/mysql
	mariadb-install-db --datadir=/var/lib/mysql
	chown -R mysql:mysql /var/lib/mysql
	/tools/setup.sh
fi
#mariadb-install-db --datadir=/var/lib/mysql

#tail -f /dev/null
mysqld --user=mysql
