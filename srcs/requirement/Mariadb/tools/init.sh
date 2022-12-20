sed -i "s/DB_NAME/$DB_NAME/g" /tools/init.sql /tools/setup.sh
sed -i "s/MARIADB_ROOT_PASS/$MARIADB_ROOT_PASS/g" /tools/init.sql /tools/setup.sh

sed -i "s/DB_ADMIN_PASS/$DB_ADMIN_PASS/g" /tools/init.sql
sed -i "s/DB_ADMIN/$DB_ADMIN/g" /tools/init.sql
