FROM alpine:3.19

RUN apk update && apk add curl

RUN curl -LO https://github.com/prometheus/mysqld_exporter/releases/download/v0.14.0/mysqld_exporter-0.14.0.linux-amd64.tar.gz && \
    tar -xzf mysqld_exporter-0.14.0.linux-amd64.tar.gz && \
    mv mysqld_exporter-0.14.0.linux-amd64/mysqld_exporter /usr/local/bin/ && \
    rm -rf mysqld_exporter-0.14.0.linux-amd64*

COPY dsn_init.sh /dsn_init.sh
RUN chmod +x /dsn_init.sh

EXPOSE 9104

ENTRYPOINT ["/dsn_init.sh"]