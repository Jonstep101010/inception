FROM alpine:3.19

RUN apk update && apk add curl

# Download and extract mysqld_exporter
ADD https://github.com/prometheus/mysqld_exporter/releases/download/v0.15.1/mysqld_exporter-0.15.1.linux-amd64.tar.gz /tmp/
RUN tar -xzf /tmp/mysqld_exporter-0.15.1.linux-amd64.tar.gz && mv mysqld_exporter-0.15.1.linux-amd64/mysqld_exporter /usr/local/bin/

EXPOSE 9104

COPY --chmod=777 exporter.sh /usr/local/bin/exporter.sh

ENTRYPOINT [ "exporter.sh" ]