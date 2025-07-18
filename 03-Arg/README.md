# ARG

```
# Normal Build
docker build -t my-app:v1 .

# Overiding ARG value
docker build --build-arg NGINX_VERSION=1.27 -t my-app:v1 .

# Run
docker run --name front-end -p 8080:80 -d my-app:v1
```
