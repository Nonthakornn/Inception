# Bind Mount

```bash

# Flag --mount
docker run --name bind-demo1 -p 8080:80 --mount type=bind,source="$(pwd)",target=/usr/share/nginx/html -d nginx:alpine-slim

# Flag -v
docker run --name bind-demo2 -p 8092:80 -v "$(pwd)":/usr/share/nginx/html -d nginx:alpine-slim  
```