#!/bin/bash

service mariadb start

echo "MARIADB_ROOT_PASSWORD: ${MARIADB_ROOT_PASSWORD}"
echo "Start Mariadb setup..."

mysql -u root << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

tail -f /dev/null