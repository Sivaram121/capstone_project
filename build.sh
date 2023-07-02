#!/bin/bash

# Set the Docker image name and tag
IMAGE_NAME="my-react-app"
IMAGE_TAG="latest"

# Build the Docker image
docker build -t "$IMAGE_NAME:$IMAGE_TAG" .

# Print a message indicating the completion of the build
echo "Docker image $IMAGE_NAME:$IMAGE_TAG built successfully."
