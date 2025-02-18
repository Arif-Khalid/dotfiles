#!/bin/bash

source $HOME/.config/dotfiles/docker/docker_utils.sh

CONTAINER_NAME="mongodb"
CONTAINER_STATUS=$(container_status $CONTAINER_NAME)
if [[ "$CONTAINER_STATUS" == "$CONTAINER_MISSING" ]]; then 
    docker run --name $CONTAINER_NAME -p 27017:27017 -d mongodb/mongodb-community-server:latest
fi

docker attach $CONTAINER_NAME
