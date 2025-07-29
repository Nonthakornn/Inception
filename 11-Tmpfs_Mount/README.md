# Tmpfs Mount

```bash
# Mount with temp file
docker run --name tmpfs-demo --mount type=tmpfs,destination=/app -d nginx:alpine-slim
```