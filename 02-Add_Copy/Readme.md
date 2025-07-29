# COPY vs ADD

> Zip ADD_FOLDER first

```
# Build

docker build -t add-vs-copy-img:v1 .

# Run
docker run --name add-vs-copy-app -p 8080:80 -d add-vs-copy-img:v1
```
