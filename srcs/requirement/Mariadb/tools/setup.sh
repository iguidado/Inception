#!/bin/sh

mkdir -p /var/lib/mysql
chown -R mysql:mysql /var/lib/mysql

if ! ls /var/lib/mysql | grep ".*"  > /dev/null
then
	echo Installing Databases
	mariadb-install-db --datadir=/var/lib/mysql
	chown -R mysql:mysql /var/lib/mysql
else
	echo Databases already installed
fi

mysqld --user=mysql &
PID=$!
while [ ! -e /run/mysqld/mysqld.sock ]
do
	sleep 1
done

mysql < /tools/init.sql
sleep 1

echo "HELLO THERE"

if ! mariadb -uroot -p"${MARIADB_ROOT_PASS}" -e "show tables from ${MARIADB_DATABASE}" | grep ".*" &> /dev/null
then
	echo "HOWDY : IM FLOWY THE FLOWER"
	mysql wp -uroot -p"${MARIADB_ROOT_PASS}" < /tools/export.sql
fi
kill -9 $PID
wait $PID
