# USER

```bash
# Build
docker build -t user-demo:v1 .

# Run
docker run --name my-app -p 8080:5000 -d user-demo:v1

# If you want to connect with the root use
docker exec --user root -it my-app /bin/bash
```