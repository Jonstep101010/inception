FROM alpine:3.19

RUN apk update && apk add --no-cache mariadb mariadb-client

# create a directory for the database
RUN mkdir -p /var/run/mysqld /var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# copy the configuration file
COPY ./mariadb.cnf /etc/my.cnf

# start the database
RUN mariadb-install-db

# copy the entrypoint script & make it executable
COPY --chmod=777 ./tools/init.sh /usr/local/bin/init.sh

# expose the port
EXPOSE 3306

# start the database
ENTRYPOINT ["init.sh"]
