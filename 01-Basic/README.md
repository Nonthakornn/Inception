# Dockerfile Basic

- Create a Basic dockerfile and push to our repository:
  - Build
  - Run
  - Tag
  - Push

> Don't forget to login before you push your docker image `docker login`

```Dockerfile
# Build the image
docker build -t nginx-custom:v1 .

# Run the image
docker run --name nginx-app-custom -p 8080:80 -d nginx-custom:v1

# Tag Image
docker tag nginx-custom:v1 nchencha/nginx-custom:v1

# Push image
docker push nchencha/nginx-custom:v1
```