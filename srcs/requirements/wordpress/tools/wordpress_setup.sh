#!/bin/sh

# Read secrets
DB_PASS=$(cat /run/secrets/database_password)
WP_USER_PASS=$(cat /run/secrets/wp_user_password)
WP_ADMIN_PASS=$(cat /run/secrets/wp_admin_password)

# create config file
if [ ! -f wp-config.php ]; then
    wp config create --force \
        --url=$WP_URL \
        --dbname=$DB_NAME \
        --dbuser=$DB_USER \
        --dbpass="${DB_PASS}" \
        --dbhost=mariadb:3306
    # install & configure wordpress
    wp core install --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password="${WP_ADMIN_PASS}" \
        --admin_email=$WP_ADMIN_EMAIL \
        --skip-email

    # create wp user
    wp user create $WP_USER \
                    $WP_USER_EMAIL \
                    --user_pass="${WP_USER_PASS}"

    # set wp home and siteurl
    wp option update home $WP_URL
    wp option update siteurl $WP_URL

    ## bonus
    # install & configure redis
    wp plugin install redis-cache --activate --allow-root
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --allow-root
    wp config set WP_CACHE_KEY_SALT $WORDPRESS_VOLUME --allow-root

    # enable & check redis
    wp redis enable --allow-root
    wp redis status --allow-root
fi

# start FastCGI in foreground
php-fpm82 -F