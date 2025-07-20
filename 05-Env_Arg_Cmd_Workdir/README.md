# ENV ARG CMD WORKDIR

```
# Build
docker build -t arg-vs-env:v1 .

# Overide ARG ENVIRONMENT
docker build --build-arg ENVIRONMENT=qa -t arg-vs-env:v2 .

# RUN
docker run --name myapp -p 8080:80 -d arg-vs-env:v1

# Overide ENV APP_ENVIRONMRNT
docker run --name myapp2 -p 8081:80 -e APP_ENVIRONMENT=qa -d arg-vs-env:v1

```