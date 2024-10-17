#!/bin/sh

# Set the MySQL data source name (DSN)
export DATA_SOURCE_NAME="${EXPORTER_USER}:${EXPORTER_PASS}@(mariadb:3306)/"

# Run mysqld_exporter
exec /usr/local/bin/mysqld_exporter