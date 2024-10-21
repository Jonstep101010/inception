#!/bin/sh

# ./srcs/secrets/wp_user_password
echo "database - password:"
read -s DB_PASS
echo -n $DB_PASS > ./srcs/secrets/database_password

# ./srcs/secrets/wp_user_password
echo "Wordpress - user password:"
read -s WP_USER_PASS
echo -n $WP_USER_PASS > ./srcs/secrets/wp_user_password

# ./srcs/secrets/wp_admin_password
echo "Wordpress - admin password:"
read -s WP_ADMIN_PASS
echo -n $WP_ADMIN_PASS > ./srcs/secrets/wp_admin_password

# ./srcs/secrets/ftp_password
echo "vsftpd - password:"
read -s FTP_PASS
echo -n $FTP_PASS > ./srcs/secrets/ftp_password