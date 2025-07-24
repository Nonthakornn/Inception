# Volume

```bash
# Create docker volume
docker volume create my-volume1

# List volume
docker volume ls

# Inspect docker volume
docker inspect my-volume1

# Output
[
    {
        "CreatedAt": "2025-07-24T14:01:41Z",
        "Driver": "local",
        "Labels": null,
        "Mountpoint": "/var/lib/docker/volumes/my-volume1/_data",
        "Name": "my-volume1",
        "Options": null,
        "Scope": "local"
    }
]

# Remove volume
docker volume rm my-volume1

# Prune volume (will remove annonymous volumes not used by any container)
docker volume prune

# Prune all volume including named volume
docker volume prune -a
```

## Start a Container with Mount flag

```bash
docker run --name volume-demo1 -p 8080:80 --mount type=volume,source=vol1,target=/myapps -d nginx:alpine-slim

# Try to create some info in /myapp
echo "hello" > hello.txt
```

## Start a Container with a Volume Using -v Flag

```bash
docker run --name volume-demo2 -p 8082:80 -v vol2:/myapps -d nginx:alpines-slim
```