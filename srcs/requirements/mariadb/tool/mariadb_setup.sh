#!/bin/bash

echo "MARIADB_ROOT_PASSWORD: ${MARIADB_ROOT_PASSWORD}"

service mariadb start

echo "MARIADB_ROOT_PASSWORD: ${MARIADB_ROOT_PASSWORD}"
echo "Start Mariadb setup..."

mariadb &