if [ ! ls /var/lib/mysql | grep ".*" ]
then
	mariadb-install-db --datadir=/var/lib/mysql
	chown -R mysql:mysql /var/lib/mysql
	mysql < /tools/init.sql
	mysql ${DB_NAME} -uroot -p"${MARIADB_ROOT_PASS}" < /tools/export.sql
	mysql -e
	rm /too
fi

mysqld --user=mysql
