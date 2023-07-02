#!/bin/bash

# Set the SSH connection details
SSH_USER="ec2-user"
SSH_HOST="54.201.108.192"
SSH_PORT="22"
SSH_KEY="/home/sivaram/Desktop/react-app.pem"

# Set the Docker image details
DOCKER_IMAGE="chintakula123/my-react-app"
DOCKER_TAG="second"

# Set the deployment directory on the server
DEPLOY_DIR="/"

# Connect to the server and deploy the Docker image
sudo ssh -i "$SSH_KEY" -p "$SSH_PORT" "$SSH_USER@$SSH_HOST" -yes << EOF
  # Pull the latest version of the Docker image
  sudo docker pull $DOCKER_IMAGE:$DOCKER_TAG

  # Stop and remove the existing container
  sudo docker stop $DOCKER_IMAGE || true
  sudo docker rm $DOCKER_IMAGE || true

  # Run a new container with the updated image
  sudo docker run -d --name $DOCKER_IMAGE -p 80:80 $DOCKER_IMAGE:$DOCKER_TAG
EOF

# Print a message indicating the completion of the deployment
echo "Docker image $DOCKER_IMAGE:$DOCKER_TAG deployed to $SSH_HOST."
