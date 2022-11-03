sed -i "s/DB_NAME/$DB_NAME/g" /tools/init.sql
sed -i "s/USERNAME/$DB_USERNAME/g" /tools/init.sql
sed -i "s/DB_PASS/$DB_PASS/g" /tools/init.sql
sed -i "s/DB_ADMIN_PASS/$DB_ADMIN_PASS/g" /tools/init.sql
sed -i "s/DB_ADMIN/$DB_ADMIN/g" /tools/init.sql

mysqld_safe --bootstrap < /tools/init.sql
