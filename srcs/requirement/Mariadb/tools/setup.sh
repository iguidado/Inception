#!/bin/sh

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


if  mariadb -uroot -padception -e "show tables from wp" | grep ".*" &> /dev/null
then
	echo hello world
if
mysql wp -uroot -padception < /tools/export.sql
kill -9 $PID
wait $PID
