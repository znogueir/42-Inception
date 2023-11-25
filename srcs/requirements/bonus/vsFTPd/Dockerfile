FROM    debian:bullseye

# installing vsftpd
RUN     apt-get update && apt-get upgrade -y && \
        apt-get install vsftpd -y && \
        apt-get clean

# copying conf and script from local files
COPY ./conf/vsftpd.conf /tmp/vsftpd.conf
COPY ./tools/ftp-server.sh /etc/ftp-server.sh

# executing script
ENTRYPOINT ["sh", "/etc/ftp-server.sh"]