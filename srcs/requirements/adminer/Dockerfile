FROM alpine:3.19

RUN apk update && apk add php php-mysqli php-session curl openssl

ADD --chmod=755 https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php /var/www/html/adminer.php
EXPOSE 81

# set permissions
RUN chown -R nobody:nobody /var/www/html/adminer.php
RUN rm -rf /var/www/html/index.html

# launch on all interfaces with built-in server on doc root
CMD ["php", "-S", "0.0.0.0:81", "-t", "/var/www/html/"]