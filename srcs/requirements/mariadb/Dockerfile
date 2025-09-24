# FROM debian:bookworm

# ARG SETUP_MARIADB_DIR=/usr/local/bin

# RUN apt-get update && \
# 	apt-get install -y mariadb-server

# COPY ./tool/mariadb_setup.sh ${SETUP_MARIADB_DIR}/

# RUN chmod +x ${SETUP_MARIADB_DIR}/mariadb_setup.sh

# ENTRYPOINT ["/usr/local/bin/mariadb_setup.sh"]

# EXPOSE 3306


#! OFFICIAL

FROM mariadb:noble

ENV MYSQL_DATABASE="exampledb"
ENV MYSQL_USER="exampleuser"
ENV MYSQL_PASSWORD="examplepass"
ENV MYSQL_RANDOM_ROOT_PASSWORD='1'

EXPOSE 3306