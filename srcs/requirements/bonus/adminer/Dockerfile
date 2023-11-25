FROM debian:bullseye

# installing php + wget
RUN apt-get update \
    && apt-get install -y php7.4 php7.4-mysql wget \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

# downloading adminer and change the name of the .php to index.php 
RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" \
    && mv adminer-4.8.1.php index.php

EXPOSE 8080

# launching php with the server on port 8080
ENTRYPOINT ["php7.4", "-S", "0.0.0.0:8080"]