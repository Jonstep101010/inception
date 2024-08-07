FROM alpine:3.19

RUN apk update && \
	apk add wget curl

RUN apk add \
	php82 \
	php82-fpm \
	php82-mysqli \
	php82-pdo_mysql \
	php82-json \ 
	php82-curl \
	php82-zip \
	php82-xml \
	php82-dom \
	php82-mbstring \
	php82-gd \
	php82-openssl \
	php82-phar \
	php82-fileinfo \
	php82-exif \
	php82-intl \
	php82-ctype \
	php82-session

COPY ./tools/wordpress_setup.sh /usr/local/bin/wordpress_setup.sh
# might not need this
RUN chmod +x /usr/local/bin/wordpress_setup.sh

WORKDIR /var/www/wordpress
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	wp core download --path=/var/www/wordpress --version=6.5.2
