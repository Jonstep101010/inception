FROM alpine:3.19

RUN apk update && apk add prometheus curl

COPY --chmod=777 prometheus.yml /etc/prometheus.yml

EXPOSE 9090

ENTRYPOINT [ "/usr/bin/prometheus", "--config.file=/etc/prometheus.yml" ]