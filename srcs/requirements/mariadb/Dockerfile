FROM debian:bookworm

ARG SETUP_MARIADB_DIR=/usr/local/bin

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

COPY ./tool/mariadb_setup.sh ${SETUP_MARIADB_DIR}/

RUN chmod +x ${SETUP_MARIADB_DIR}/mariadb_setup.sh

ENTRYPOINT [ "bash" , "/usr/local/bin/mariadb_setup.sh"]
