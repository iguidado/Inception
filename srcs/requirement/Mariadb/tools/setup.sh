sed -i "s/DB_NAME/$MARIADB_NAME/g" /tools/init.sql
sed -i "s/USERNAME/$MARIADB_USER/g" /tools/init.sql
sed -i "s/DB_PASS/$MARIADB_PASS/g" /tools/init.sql

sed -i "s/DB_ADMIN_PASS/$MARIADB_ADMIN_PASS/g" /tools/init.sql
sed -i "s/DB_ADMIN/$MARIADB_ADMIN/g" /tools/init.sql

mysqld --user=mysql &
while [ ! -e /run/mysqld/mysqld.sock ]
do
	sleep 1
done

mysql < /tools/init.sql
mysql ${MARIADB_NAME} < /tools/export.sql
#PID=$!
#kill -9 $PID
#wait $PID
