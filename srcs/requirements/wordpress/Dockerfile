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
	php82-session

COPY --chmod=777 ./tools/wordpress_setup.sh /usr/local/bin/wordpress_setup.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
WORKDIR /var/www/wordpress 
RUN wp core download --path=/var/www/wordpress --version=6.5.2

EXPOSE 9000
CMD [ "wordpress_setup.sh" ]