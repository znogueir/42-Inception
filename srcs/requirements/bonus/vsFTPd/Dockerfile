FROM    debian:bullseye

RUN     apt-get update && apt-get upgrade -y && \
        apt-get install vsftpd -y && \
        apt-get clean

RUN     mkdir -p /etc/vsftpd/ && \
        chmod 755 -R /etc/vsftpd/

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/ftp-server.sh /etc/ftp-server.sh

ENTRYPOINT ["sh", "/etc/ftp-server.sh"]