#!/bin/bash

echo -e "\e[1m================ START =================\e[0m"

echo -e "\e[1m============= ENTERING DIR =============\e[0m"
echo "cd /var/www/html/wordpress"
cd /var/www/html/wordpress

echo -e "\e[1m============== PINGING DB ==============\e[0m"

#while ! mysqladmin ping --silent; do
#	echo "Waiting for MariaDB to start..."
#	sleep 1
#done

echo -e "\e[1mMariaDB is \e[38;5;34mready\e[0m."

echo -e "\e[1m========= CHECKING FOR WP CORE =========\e[0m"

if ! wp core is-installed --allow-root; then
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
		--admin_user=${ADMIN_LOGIN} \
		--admin_password=${ADMIN_PASSWORD} \
		--admin_email=${ADMIN_EMAIL};

echo -e "\e[1m============= USER CREATE ==============\e[0m"
	wp user create --allow-root \
		${USER1_LOGIN} ${USER1_EMAIL} \
		--role=author \
		--user_pass=${USER1_PASSWORD};

echo -e "\e[1m============= CACHE FLUSH ==============\e[0m"
	wp cache flush --allow-root

echo -e "\e[1m========= INSTALL CONTACT-FORM =========\e[0m"
	wp plugin install contact-form-7 --allow-root --activate

echo -e "\e[1m============ SETUP LANGUAGE ============\e[0m"
	wp language core install en_US --allow-root --activate

echo -e "\e[1m======== DELETE USELESS PLUGINS ========\e[0m"
	wp theme delete twentytwenty twentynineteen --allow-root
	wp plugin delete hello --allow-root

echo -e "\e[1m\e[38;5;34m** BONUS : INSTALL REDIS-OBJECT-CACHE **\e[0m"
	REDIS_CONFIG_LINES=$(cat <<EOL
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', '6379');
define('WP_CACHE_KEY_SALT', '${DOMAIN_NAME}');
EOL
)
	sed -i "/\/* Add any custom values between this line and the "stop editing" line. *\//a $REDIS_CONFIG_LINES" /var/www/html/wordpress/wp-config.php
	#cp -r /var/www/html/wordpress/wp-content/plugins/redis-object-cache/object-cache.php /var/www/html/wordpress/wp-includes/cache.php
	wp plugin install redis-object-cache --allow-root --activate
	#cp -r /var/www/html/wordpress/wp-content/plugins/redis-object-cache/object-cache.php /var/www/html/wordpress/wp-content/
fi

echo -e "\e[1m======== CHECKING FOR /run/php/ ========\e[0m"
if [ ! -d /run/php ]; then
	mkdir /run/php/;
	echo -e "\e[1mDir '/run/php/' created \e[38;5;34msuccesfully\e[0m."
fi

echo -e "\e[38;5;34m############### FINISHED ###############\e[0m"

cd /var/www/html/wordpress/
chmod 777 -R wp-content
chmod 777 -R wp-config.php
chmod 777 -R wp-includes
chmod 777 -R wp-admin

chown -R www-data:www-data wp-includes
chown -R www-data:www-data wp-content
chown -R www-data:www-data wp-admin
chown -R www-data:www-data wp-config.php

#mkdir -p /var/www/html/wordpress/static/
cp -r /etc/static/ /var/www/html/wordpress/
chown -R www-data:www-data static/*

# ======================== BONUS : REDIS ======================== #

echo "define('WP_REDIS_HOST', 'redis');" >> /var/www/html/wordpress/wp-config.php
echo "define('WP_REDIS_PORT', '6379');" >> /var/www/html/wordpress/wp-config.php
echo "define('WP_CACHE_KEY_SALT', '${DOMAIN_NAME}');" >> /var/www/html/wordpress/wp-config.php

# =============================================================== #

echo -e "\e[1m=============== EXEC PHP ==============\e[0m"
exec /usr/sbin/php-fpm7.4 -F
