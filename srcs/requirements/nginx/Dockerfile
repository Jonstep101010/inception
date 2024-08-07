FROM alpine:3.19

RUN apk update && apk add --no-cache nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /path/to/ssl/nginx-selfsigned.key \
    -out /path/to/ssl/nginx-selfsigned.crt
