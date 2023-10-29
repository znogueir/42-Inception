FROM debian:bullseye

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server && \
	apt-get install -y mariadb-client && \
	apt-get install -y vim && \
	apt-get clean
	#apt-get install -y procps

ENV SQL_DATABASE=db_inception
ENV SQL_USER=db_user
ENV SQL_PASSWORD=db_password
ENV SQL_ROOT_PASSWORD=db_root_password
ENV SQL_HOST=mariadb:3306

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN	mkdir -p /var/run/mysqld && \
	mkdir -p /var/lib/mysql && \
	chown mysql:mysql /var/run/mysqld/ && \
	chown mysql:mysql /var/lib/mysql/ && \
	chmod -R 755 /var/run/mysqld/ && \
	chmod -R 755 /var/lib/mysql/

EXPOSE 3306

RUN mkdir -p /etc/mariadb/startup_script/
COPY ./tools/mariadb-script.sh /etc/mariadb/startup_script/mariadb-script.sh
RUN chmod -R 755 /etc/mariadb/startup_script/mariadb-script.sh

ENTRYPOINT ["bash", "/etc/mariadb/startup_script/mariadb-script.sh"]
