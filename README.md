# Inception

## Why Docker?

### Pain Point

- Installation & Configuration
  - Time Consuming
  - Need to perform installation and configuration on every server and every environment
- Compatibility & Dependency
  - Need to keep resolving issues related to libraries and dependency
- Inconsistencies across environment
  - Hard to track changes across environment.
- Operational Support
  - WHen a new developer joins the team, It takes a lots of time to provision the development environment.

![Physical and Vm](./asset/physical_virtual.png)

## Advantage of Docker

- Flexible - Complex apps can be easily to containerized.
- LightWeight - Containers use fewer resources than virtaul machines.
- Portable - You can build locally, deploy to the cloud and run anywhere.
- Loosely Coupled - Replace or upgrade containers without affecting others.
- Scalable - Easy to scale containers across data center.
- Secure - Containers provide isolation without extra setup.

## Docker Architecture

- Docker Daemon 
  - Listens for Docker API requests and manges Docker objects such as images, container, networks and volumes
- Docker Client
  - Can be present on either Docker Host or any other machine (local desktop)
- Docker Images
  - An image is a **read-only-template** with **instruction for creating a Docker container**.
  - An image is based on another image with some additional cuztomization.
- Docker Containers
  - A container is a runnable instance of an image.
  - We can create,start,stop,move,delete a container using the Docker API or CLI
  - We can connect a container to one or more networks attach storage to it, or even create a new image based on its current state
  - When a container is removed, any changes to its state that are not stored in **presistent storage disappear**.

## Docker Command (Basic)

- **Pull** Docker Image from Docker Hub
	`docker pull <image_name:version>`
- **Run** Docker Container
	`docker run --name <container_name> -p <host_port:container_port> -d <image_name:tag_number>
- **Start** and **Stop** Docker Containers 
	`docker start <app_name>`
	`docker stop <app_name>`
- **Remove** Docker Containers
	`docker rm <app_name>`
- **Remove** Docker Images 
	`docker rmi <image_name>`
- **Prune**
	```
	# Only "dangling" images (untagged images like <none>:<none>)
	docker image prune

	# Remove all unused images (including tagged ones)
	docker image prune -a

	# Prune Container with force (no confirmation):
	docker container prune -f
	```

### List Docker Containers

```
# List only running containers
docker ps

# List every containers (including the stop ones)
docker ps -a

# List only containers IDS
dicker ps -q
```

### Connect to Docker Container via command line

```
# Connect to the container's terminal
# i - interactive
# t - tty
docker exec -it <container_name> /bin/sh

# Example of exec command directly
docker -exec -it <container_name> ls
```

## Dockerfile

- A set of instruction to build a Docker Image
- Automates the process of creating Dicker images by specifying steps which are called `Instruction`
- Example:
  - Install software
  - Copy files
  - Set ENV
  - Run Commands

### Build Docker Image from Dockerfile

```
# Build Docker Image
docker build -t <custom_image_name:tag> .

# Run Docker Container
docker run --name myapp1 -p 8080:80 -d <image_name:tag>

# List the port we are using in our laptop
sudo lsof -i -P -n | grep LISTEN
```
### Push Docker Image to Docker Hub

```
# List Docker images
docker images

# Tag Docker image
docker tag <image_name:tag> DOCKER_USERNAME/<image_name:tag>

# Push image
docker push DOCKER_USERNAME/<image_name:tag>
```

### LABEL Instruction

- What is Label instruction in Dockerfile?
  - Adds metadata to an image
  - An image can have more than one label
  - Labels included in the base image are inherited by your image
  - If a label already exists but with different value, the most-recent-applied value **overides** any previous-set value.

```
# Custom Labels
LABEL maintainer="Nonthakorn Non"  
LABEL version="1.0"
LABEL description="A simple Nginx Application"

# OCI Labels (Open Container Initiative)
LABEL org.opencontainers.image.authors=""
LABEL org.opencontainers.image.title=""
LABEL org.opencontainers.image.description=""
LABEL org.opencontainers.image.version=""
LABEL org.opencontainers.image.revision="" 
LABEL org.opencontainers.image.created=""
LABEL org.opencontainers.image.url=""
LABEL org.opencontainers.image.source=""
LABEL org.opencontainers.image.documentation=""
LABEL org.opencontainers.image.vendor=""
LABEL org.opencontainers.image.licenses=""
```

### COPY vs ADD

- What is COPY? 
  - The COPY instruction copies new files or directories from `src` and adds them to the file system of the image at that path `dest`
  - Files and directories can be copied from the build context, build stage, named context, an image
  - Cannot extract file
  - Preferred for all local file copies
- What is ADD?
  - It copies new files or directories from `src` and adds them to the filesystem of the image at the path `dest`
  - Files and directories can be copied from the build context, remote URL, Git repository
  - Automatically  extract a zip file
  - Use only for tar extraction or URL fetching
  - Docker does not extract `.zip` `.rar` `.7z`

### ARG Instruction

- What is ARG
  - Defines a variable that users can pass at build-time to the builder with
    - `docker build`
    - using the flag can override on Dockerfile
    - `ENV` variables always overrides ARG variables (if same variable defined in both places)

### RUN and EXPOSE

- What is RUN?
  - It will execute any commands to create a new layer on top of the current image
  - The added layer is used in the next step in the Dockerfile 
  - Cache invalidatoin for RUN instruction: Is not validated automatically during nex build
  - The cache for RUN instruction can be invalidate by using `--no-cache` flag
    - `--no-cache` - Don't store the package index cache (keeps image smaller)
- What is EXPOSE
  - Informs Docker that the cotainer listens on the specified network ports at runtime
  - Can you if you want to EXPOSE ond UDP or TCP
    - `EXPOSE 80/udp`
    - `EXPOSE 80/tcp`