FROM alpine:3.19

RUN apk update && apk add --no-cache nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=${COUNTRY}/ST=${STATE}/L=${CITY}/O=${ORGANIZATION}/OU=${UNIT_NAME}/CN=${COMMON_NAME}"

COPY ./nginx.conf /etc/nginx/nginx.conf
# testing static page
# COPY --chown=777 ./index.html /var/www/html/index.html

EXPOSE 443
EXPOSE 81
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]