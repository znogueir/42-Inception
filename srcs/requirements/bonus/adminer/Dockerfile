FROM    debian:bullseye

RUN     apt-get update -y && \
        apt-get upgrade -y && \
        apt-get install adminer -y \
        php && \
        apt-get clean

CMD	[ "php", "-S", "[::]:8080"]