sed -i "s/DB_NAME/$DB_NAME/g" /tools/init.sql
sed -i "s/MARIADB_ROOT_PASS/$MARIADB_ROOT_PASS/g" /tools/init.sql

sed -i "s/DB_ADMIN_PASS/$DB_ADMIN_PASS/g" /tools/init.sql
sed -i "s/DB_ADMIN/$DB_ADMIN/g" /tools/init.sql

mysqld --user=mysql &
while [ ! -e /run/mysqld/mysqld.sock ]
do
	sleep 1
done

mysql < /tools/init.sql
mysql ${DB_NAME} -uroot -p"${MARIADB_ROOT_PASS}" < /tools/export.sql
#PID=$!
#kill -9 $PID
#wait $PID
