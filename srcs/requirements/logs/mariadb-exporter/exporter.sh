#!/bin/sh

# Read secrets
DB_PASS=$(cat /run/secrets/database_password)

# create config file with vars
cat <<EOF > /etc/.my.cnf
[client]
user=${DB_USER}
password=${DB_PASS}
host=mariadb
EOF

exec mysqld_exporter --config.my-cnf=/etc/.my.cnf