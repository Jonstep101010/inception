#!/bin/sh

export MYSQLD_EXPORTER_PASSWORD=${EXPORTER_PASS}
# Run mysqld_exporter
exec /usr/local/bin/mysqld_exporter --mysqld.address=mariadb:3306 --mysqld.username=${EXPORTER_USER}