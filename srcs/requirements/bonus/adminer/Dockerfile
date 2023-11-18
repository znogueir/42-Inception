FROM debian:bullseye

# Install required packages
RUN apt-get update && apt-get install -y \
    php \
    php-mysql \
    php-pgsql \
    php-sqlite3 \
    php-odbc \
    && rm -rf /var/lib/apt/lists/*

# Create adminer user and directories
RUN groupadd -r adminer && useradd -r -g adminer -m -d /var/www/html adminer

# Set the working directory
WORKDIR /var/www/html

# Download and place Adminer
ENV ADMINER_VERSION 4.8.1
ADD https://github.com/vrana/adminer/releases/download/v$ADMINER_VERSION/adminer-$ADMINER_VERSION.php /var/www/html/adminer.php

# Adjust ownership
RUN chown adminer:adminer /var/www/html/adminer.php

# Expose the port
EXPOSE 8080

# Switch to the adminer user and start PHP's built-in server
USER adminer
CMD ["php", "-S", "[::]:8080", "-t", "/var/www/html/"]
