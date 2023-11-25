#!/bin/sh

# create dirs for vsftpd + moving the conf to the location
mkdir -p /var/www/html
mkdir -p /etc/vsftpd/
mv /tmp/vsftpd.conf /etc/vsftpd.conf

# creating user for ftp + settign up password and giving ownership
adduser $FTP_USER --disabled-password
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd
chown -R $FTP_USER:$FTP_USER /var/www/html

# adding the user to the user list
echo $FTP_USER | tee -a /etc/vsftpd.userlist

# launching server
echo "vsFTPd started on port 2121"
/usr/sbin/vsftpd /etc/vsftpd.conf