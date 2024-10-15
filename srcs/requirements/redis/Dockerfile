FROM alpine:3.19

RUN apk update && apk add redis

EXPOSE 6379

COPY --chown=root:root redis.conf /etc/redis.conf

CMD [ "redis-server", "/etc/redis.conf" ]