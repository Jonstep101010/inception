#!/bin/sh

# create config file
wp config create --force \
    --url=$WP_URL \
    --dbname=$DB_NAME \
    --dbuser=$DB_USER \
    --dbpass=$DB_PASS \
    --dbhost=mariadb:3306

# install & configure wordpress
wp core install --url=$WP_URL \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASS \
    --admin_email=$WP_ADMIN_EMAIL \
    --skip-email

# create wp user
wp user create $WP_USER \
				$WP_USER_EMAIL \
				--user_pass=$WP_USER_PASS

# set wp home and siteurl
wp option update home $WP_URL
wp option update siteurl $WP_URL

# start FastCGI in foreground
php-fpm82 -F