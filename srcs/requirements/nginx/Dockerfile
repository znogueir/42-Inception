FROM debian:bullseye

RUN 	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y nginx && \
	apt-get install -y vim && \
	apt-get install -y curl && \
	apt-get install -y openssl

RUN	mkdir -p /etc/nginx/ssl

RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=znogueir.42.fr/UID=znogueir@student.42.fr"

RUN 	chmod 755 /var/www/html/ && \
	chown -R www-data:www-data /var/www/html/

RUN	mkdir /var/www/html/site/
COPY	./site/index.html /var/www/html/site/index.html

RUN 	mkdir -p /var/run/nginx
COPY 	./conf/nginx.conf /etc/nginx/nginx.conf

RUN ls /var/www/html/
CMD ["nginx", "-g", "daemon off;"]
