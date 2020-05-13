# Downloading a Docker Image
docker pull nginx:latest

# Listing out all Docker images
docker image ls

# Creating a Container out of a Docker image
docker run -tid nginx:latest

# Exec into a docker container
docker exec -ti container_id /bin/bash