#!/bin/bash

service mariadb start;

SQL_DATABASE=inception
SQL_USER=dbuser
SQL_PASSWORD=dbpassword
SQL_ROOT_PASSWORD=rootpassword
SQL_HOST=mariadb:3306

echo $SQL_DATABASE
echo $SQL_USER
echo $SQL_USER
echo $SQL_ROOT_PASSWORD
echo $SQL_HOST

mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

exec mysqld_safe

echo -e "\033[3mDatabase and user creation successful\033[0m"
