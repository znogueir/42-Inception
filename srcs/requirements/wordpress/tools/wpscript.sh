#!/bin/bash

echo -e "\e[1m================ START =================\e[0m"

echo -e "\e[1m============= ENTERING DIR ==============\e[0m"
cd /var/www/wordpress

echo TEST ${SQL_DATABASE} ${SQL_USER}

grep "/run/mysqld/mysqld.sock" /etc/php/7.4/fpm/php.ini

echo -e "\e[1m============== PINGING DB ==============\e[0m"
echo ${SQL_HOST}
mysqladmin ping --host=localhost -p${SQL_ROOT_PASSWORD}
until mysql ping -h mariadb -u${SQL_USER} -p${SQL_PASSWORD}i > /dev/null 2>&1; do
	echo "Waiting for MariaDB to start..."
	sleep 1
done
echo -e "\e[38;5;10mMariaDB is ready.\e[0m"

#su www-data
#whoami
#cat /etc/passwd

#if ! wp core is-installed; then
#	wp core download --allow-root
echo -e "\e[1m============ CONFIG CREATE =============\e[0m"
	wp config create --allow-root --dbname=${SQL_DATABASE} \
		--dbuser=${SQL_USER} \
		--dbpass=${SQL_PASSWORD} \
		--dbhost=${SQL_HOST} \
		--url=https://${DOMAIN_NAME};

echo -e "\e[1m============= CORE INSTALL =============\e[0m"
	wp core install --allow-root \
		--url=https://${DOMAIN_NAME} \
		--title=${SITE_TITLE} \
		--admin_user=${ADMIN_USER} \
		--admin_password=${ADMIN_PASSWORD} \
		--admin_email=${ADMIN_EMAIL};

echo -e "\e[1m============= USER CREATE =============\e[0m"
	wp user create --allow-root \
		${USER1_LOGIN} ${USER1_EMAIL} \
		--role=author \
		--user_pass=${USER1_PASSWORD};

echo "============= CACHE FLUSH =============="
	wp cache flush --allow-root

echo "========= INSTALL CONTACT-FORM ========="
	wp plugin install contact-form-7 --allow-root --activate

echo "============ SETUP LANGUAGE ============"
	wp language core install en_US --allow-root --activate

echo "======== DELETE USELESS PLUGINS ========"
	wp them delete twentytwenty twentynineteen --allow-root
	wp plugin delete hello --allow-root

echo "=========== REWRITE STRUCT ============="
	wp rewrite structure '/%postname%/' --allow-root

echo "========== END OF INSTRUCTIONS ========="
#fi

if [ ! -d /run/php ]; then
	mkdir /run/php;
fi

echo "=============== FINISHED ==============="

exec /usr/sbin/php-fpm7.3 -F -R
