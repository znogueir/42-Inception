FROM    debian:bullseye

RUN     apt-get update && apt-get upgrade -y && \
        apt-get install vsftpd -y && \
        apt-get clean

COPY ./conf/vsftpd.conf /tmp/vsftpd.conf

COPY ./tools/ftp-server.sh /etc/ftp-server.sh

ENTRYPOINT ["sh", "/etc/ftp-server.sh"]