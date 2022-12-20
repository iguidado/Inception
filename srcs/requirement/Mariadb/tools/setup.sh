#!/bin/sh

mysqld --user=mysql &
PID=$!
while [ ! -e /run/mysqld/mysqld.sock ]
do
	sleep 1
done
mysql < /tools/init.sql
mysql DB_NAME -uroot -pMARIADB_ROOT_PASS < /tools/export.sql
kill -9 $PID
wait $PID
rm -rf /tools/
