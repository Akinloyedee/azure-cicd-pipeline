# Docker Web Server Deployment

## Project Overview
This project demonstrates the deployment and management of a web server using Docker and Nginx. A custom HTML webpage was containerized and deployed using Docker, with health monitoring and lifecycle management practiced throughout.

## Technologies Used
- Docker
- Nginx
- HTML
- Linux/WSL

## Prerequisites
- Docker Desktop / Docker Engine installed
- Tested on WSL2 (Ubuntu)

## Project Workflow
1. Pulled the official Nginx Docker image from Docker Hub.
2. Created and managed an Nginx container.
3. Practiced the Docker container lifecycle.
4. Created a custom HTML webpage.
5. Built a custom Docker image using a Dockerfile, copying the webpage into the image.
6. Deployed the custom image as a container.
7. Monitored the container using Docker logs, inspect, and stats.
8. Added a Docker health check.
9. Simulated and resolved a container issue (see Troubleshooting below).

## Dockerfile
```dockerfile
FROM nginx:1.23
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*
COPY html /usr/share/nginx/html
HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost/ || exit 1
```

## How to Run
```bash
# Build the image
docker build -t my-docker-web-server

# Run the container
docker run -d -p 8082:80 --name my-custom-website my-webserver
```
Then open `http://localhost:8082` in your browser to view the custom page.

## Docker Commands Used
```bash
docker pull nginx        # Pull the base image from Docker Hub
docker build             # Build the custom image from the Dockerfile
docker run               # Create and start a new container
docker ps                # List running containers
docker ps -a             # List all containers, including stopped ones
docker images            # List local images
docker stop               # Stop a running container
docker start               # Start a stopped container
docker restart             # Restart a container
docker pause / unpause     # Pause and resume a container
docker logs               # View container logs
docker inspect            # View detailed container/image metadata
docker stats              # View live resource usage (CPU, memory)
docker exec -it <name> sh # Open a shell inside a running container
```

## Health Monitoring
A `HEALTHCHECK` instruction was added to the Dockerfile so Docker periodically verifies the web server is actually responding, not just that the process is running. This is visible in the `STATUS` column of `docker ps` (shows `healthy` after the first check interval) and in the `Health` section of `docker inspect`.

## Troubleshooting Example
To practice real-world debugging, the webpage file was deliberately deleted from inside the running container:
```bash
docker exec -it my-custom-website rm /usr/share/nginx/html/index.html
```
This caused the site to return a 403/404 error in the browser. The issue was diagnosed using:
```bash
docker logs my-custom-website
docker exec -it my-custom-website sh
```
The container was accessed directly to confirm the missing file, and the page was restored by rebuilding and redeploying the container from the original image.

## Best Practices Applied
- Pinned the base image to a specific version (`nginx:1.23`) instead of `latest`, for reproducibility.
- Cleaned up the `apt-get` package cache in the same `RUN` layer to keep the image size down.
- Added a `HEALTHCHECK` so container health is monitored automatically rather than assumed.
- Used official, minimal base images rather than a general-purpose OS image.

## What I Learned
This project introduced me to several new Docker concepts, including how to add a health check to a container, how monitoring commands like `stats` and `inspect` work in practice, and how to diagnose and recover from a broken container using `logs` and `exec`. It also reinforced the full container lifecycle beyond just starting and stopping a container.
