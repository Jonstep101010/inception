#!/bin/sh

# Read secrets
DB_PASS=$(cat /run/secrets/database_password)

# if the database directory does not exist
if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then
	# pass configuration to the database daemon
	mariadbd --user=mysql --bootstrap <<EOF
	FLUSH PRIVILEGES;
	CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
	CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
	GRANT ALL PRIVILEGES on \`${DB_NAME}\`.* TO '${DB_USER}'@'%' WITH GRANT OPTION;
	FLUSH PRIVILEGES;
	GRANT ALL ON *.* TO 'dbuser'@'%';
	FLUSH PRIVILEGES;
EOF
else
	echo "Database already exists. Starting..."
	exec /usr/bin/mariadbd --user=mysql --datadir=/var/lib/mysql
fi
