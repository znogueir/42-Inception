#!/bin/sh

#if [ ! -f "/var/run/vsftpd/vsftpd.conf.bak" ]; then

    mkdir -p /var/www/html
    mkdir -p /var/run/vsftpd/
    #chmod 755 -R
    #cp /var/run/vsftpd/vsftpd.conf /var/run/vsftpd/vsftpd.conf.bak
    mv /etc/vsftpd.conf /var/run/vsftpd/vsftpd.conf

    # Add the FTP_USER, change his password and declare him as the owner of wordpress folder and all subfolders
    adduser $FTP_USER --disabled-password
    echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd
    chown -R $FTP_USER:$FTP_USER /var/www/html

    #chmod +x /etc/vsftpd/vsftpd.conf
    echo $FTP_USER | tee -a /var/run/vsftpd.userlist

#fi

echo "vsFTPd started on port 2121"
/usr/sbin/vsftpd /var/run/vsftpd/vsftpd.conf