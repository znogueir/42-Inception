#!/bin/bash

service mariadb start;

#mysql -e "CREATE DATABASE IF NOT EXISTS inception;"
#echo -e "TOUT VA BIEN"

#sleep 10

#mysql -e "CREATE USER IF NOT EXISTS dbuser@localhost IDENTIFIED BY dbpassword;"
#echo -e "TOUT VA BIEN"
#mysql -e "GRANT ALL PRIVILEGES ON inception.* TO dbuser@'%' IDENTIFIED BY dbpassword;"
#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY rootpassword;"
#mysql -e "FLUSH PRIVILEGES;"


mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY \`${SQL_PASSWORD}\`;"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY \`${SQL_PASSWORD}\`;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY \`${SQL_ROOT_PASSWORD}\`;"
mysql -e "FLUSH PRIVILEGES;"

exec mysqld_safe

echo -e "Database and user creation successful !"
