# Multi Container

## MySQL Database Setup

```bash

# Create a new Docker network for multi container application
docker network create ums-app

# List Network
docker network ls

# Create mysql container
docker run -d \
    --network ums-app --network-alias mysql \
    --name ums-mysqldb \
    -v ums-mysql-data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=dbpassword11 \
    -e MYSQL_DATABASE=webappdb \
    -p 3306:3306 \
    mysql:8.0

# Verify MySQL Container
docker ps
docker volume ls
docker exec -it ums-mysqldb mysql -u root -p
```

## WebApp Container Setup

```bash
# Pull the image
docker pull ghcr.io/stacksimplify/usermgmt-webapp-v6:latest

docker run -d \
    --network ums-app \
    --name ums-app \
    -e DB_HOSTNAME=mysql \
    -e DB_PORT=3306 \
    -e DB_NAME=webappdb \
    -e DB_USERNAME=root \
    -e DB_PASSWORD=dbpassword11 \
    -p 8080:8080 \
    ghcr.io/stacksimplify/usermgmt-webapp-v6:latest

```

### Checking the data

```bash
# Exec to mysql database
docker exec -it ums-mysqldb mysql -u root -pdbpassword11

# MySQL commands to check the user data
mysql> show schemas;
mysql> use webappdb;
mysql> show tables;
mysql> select * from user;
```