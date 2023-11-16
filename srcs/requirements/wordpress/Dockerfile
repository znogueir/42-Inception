FROM debian:bullseye

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y wget \
	php \
	php-gd \
	php-xml \
	php-cgi \
	php-fpm \
	php-mysql \
	php-common \
	php-mbstring \
	mariadb-client && \
	apt-get clean

# env variables for individual testing (without docker compose)
#ENV	SQL_DATABASE=db_inception
#ENV	SQL_USER=db_user
#ENV	SQL_PASSWORD=db_password
#ENV	SQL_ROOT_PASSWORD=db_root_password
#ENV	SQL_HOSTS=mariadb:3306

# downloading wordpress and extracting files
RUN	wget https://fr.wordpress.org/wordpress-6.3.2-fr_FR.tar.gz -P /var/www/html/ && \
	cd /var/www/html && tar -xzf wordpress-6.3.2-fr_FR.tar.gz && \
	rm wordpress-6.3.2-fr_FR.tar.gz

# downloading wp automatic conf tool
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# giving perms
RUN	chown -R root:root /var/www/html/wordpress && \
	chown -R www-data:www-data /var/www/* && \
	chmod -R 755 /var/www/*

# copying startup script to setup wordpress and giving perms
RUN		mkdir -p /etc/wordpress/startup_script/
COPY		./tools/wpscript.sh /etc/wordpress/startup_script/wpscript.sh
RUN		chmod +x /etc/wordpress/startup_script/wpscript.sh

# copying conf file for php-fpm
COPY	./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY	./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# adding options to the php.ini file
RUN	echo "clear_env=no" >> /etc/php/7.4/fpm/php.ini && \
	echo "listen=wordpress:9000" >> /etc/php/7.4/fpm/php.ini

# copying static website
# RUN	mkdir -p /var/www/html/wordpress/static/css_styles/
COPY	./static/ /etc/static/

EXPOSE 9000

CMD ["bash", "/etc/wordpress/startup_script/wpscript.sh"]
