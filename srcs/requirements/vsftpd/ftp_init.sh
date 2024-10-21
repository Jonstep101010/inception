#!/bin/sh

echo "$FTP_USER:$(cat /run/secrets/ftp_password)" | chpasswd

exec /usr/sbin/vsftpd /etc/vsftpd.conf