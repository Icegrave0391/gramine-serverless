#!/bin/bash
source .env

img_exists=$(docker image ls | grep "$DOCKERIMG" | awk '{print $1}')

if [[ -z "$img_exists" ]]; then
        echo "Creating Docker image: $DOCKERIMG with $DOCKERFILE..."
        docker build -t $DOCKERIMG -f $DOCKERFILE .
else
        echo "Docker image: $DOCKERIMG already exists. Pass."
fi
