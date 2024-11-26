FROM alpine:3.19

RUN apk update
RUN apk add \
	curl wget \
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
	php82-session \
	php82-tokenizer \
	redis

COPY --chmod=777 ./tools/wordpress_setup.sh /usr/local/bin/wordpress_setup.sh

ADD --chmod=777 https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/
RUN mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp
WORKDIR /var/www/html
RUN wp core download --version=6.5.2

# provide config file
COPY www.conf /etc/php82/php-fpm.d/www.conf
# create wp-data user and group
RUN addgroup -S wp-data && adduser -S wp-data -G wp-data
# allow log directory access
RUN chown -R wp-data:wp-data /var/log/php82 /var/www/html
USER wp-data

EXPOSE 9000
CMD [ "wordpress_setup.sh" ]