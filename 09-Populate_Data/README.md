# Populate Data

```bash

# Build
docker build -t nginx-static:v1 .

# Run with volumes container base
docker run --name volumes-base-container -p 8080:80 -d nginx-static:v1

# Run with mouth volume
docker run --name my-volume-mount -p 8090:80 --mount type=volume,source=vol-mount-1,target=/usr/share/nginx/html -d nginx-static:v1

# List volume
docker volume ls

# DRIVER    VOLUME NAME
# local     vol-mount-1

# Mount existing  volume to a new container (vol-mount=1)
docker run --name existing-volume -p 8083:80 -v vol-mount-1:/usr/share/nginx/html -d nginx:alpine-slim
```