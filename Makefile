#VOLUME_DIR = /home/nchencha/data

VOLUME_DIR = /home/nchencha/Documents/onsite/inception/data
DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

all: up

up:
	mkdir -p ${VOLUME_DIR}/mariadb
	docker compose -f ${DOCKER_COMPOSE_FILE} up --build -d

nc:
	docker compose -f ${DOCKER_COMPOSE_FILE} build --no-cache
	docker compose -f ${DOCKER_COMPOSE_FILE} up -d 

down:
	docker compose -f  ${DOCKER_COMPOSE_FILE} down

start:
	docker compose -f ${DOCKER_COMPOSE_FILE} start

stop:
	docker compose -f ${DOCKER_COMPOSE_FILE} stop

clean:
	docker compose -f ${DOCKER_COMPOSE_FILE} down -v --rmi all

fclean: clean
	docker system prune -af --volumes
	rm -rf ${VOLUME_DIR}			2>/dev/null || true

re: down up

.PHONY : all up down start stop re clean fclean