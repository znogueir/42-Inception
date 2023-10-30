FROM debian:bullseye

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y wget && \
	apt-get install -y	php7.3 \
				php-fpm \
				php-mysql \
				mariadb-client

#ENV	SQL_DATABASE=db_inception
#ENV	SQL_USER=db_user
#ENV	SQL_PASSWORD=db_password
#ENV	SQL_ROOT_PASSWORD=db_root_password
#ENV	SQL_HOSTS=mariadb:3306

EXPOSE 9000

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN	wget https://fr.wordpress.org/wordpress-6.3.2-fr_FR.tar.gz -P /var/www && \
	cd /var/www && tar -xzf wordpress-6.3.2-fr_FR.tar.gz && \
	rm wordpress-6.3.2-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress && \
	chown -R www-data:www-data /var/www/* && \
	chmod -R 755 /var/www/*

EXPOSE	9000

RUN	mkdir -p /etc/wordpress/startup_script/
COPY	./tools/wpscript.sh /etc/wordpress/startup_script/wpscript.sh
RUN	chmod +x /etc/wordpress/startup_script/wpscript.sh

RUN	echo "clear_env=no" >> /etc/php/7.4/fpm/php.ini && \
	echo "listen=wordpress:9000" >> /etc/php/7.4/fpm/php.ini

#RUN	echo "mysqld.default_socket=/var/run/mysqld/mysqld.sock" >> /etc/php/7.4/php.ini

#RUN	echo "mysql.default_socket=/var/run/mysqld/mysqld.sock" >> /etc/php/7.4/php.ini

RUN	sed -i '/;mysql.default_socket/c\mysql.default_socket=\/var\/run\/mysqld\/mysqld.sock' /etc/php/7.4/fpm/php.ini
#RUN	sed -i 's/;mysqld.default_socket/mysql.default_socket=\/var\/run\/mysqld\/mysqld.sock/g' /etc/php/7.4/fpm/php.ini
RUN	sed -i '/mysqli.default_socket/c\mysqli.default_socket=\/var\/run\/mysqld\/mysqld.sock' /etc/php/7.4/fpm/php.ini
RUN	sed -i '/pdo_mysql.default_socket/c\pdo_mysql.default_socket=\/var\/run\/mysqld\/mysqld.sock' /etc/php/7.4/fpm/php.ini

ENTRYPOINT ["bash", "/etc/wordpress/startup_script/wpscript.sh"]
