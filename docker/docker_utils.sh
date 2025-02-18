#!/bin/bash

CONTAINER_RUNNING="container_running"
CONTAINER_MISSING="container_missing"

container_status ()
{    
    local CONTAINER_NAME=$1
    if [ ! "$(docker ps -a -q -f name=$CONTAINER_NAME)" ]; then
        echo $CONTAINER_MISSING
    else 
        if [ "$(docker ps -aq -f status=exited -f name=$CONTAINER_NAME)" ]; then
            # start container
            docker start $CONTAINER_NAME
        fi
        echo $CONTAINER_RUNNING
    fi
}
