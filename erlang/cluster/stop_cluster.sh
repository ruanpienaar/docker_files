#!/bin/bash
CONTAINERS=`docker ps -q`
for CONTAINER in $CONTAINERS; do
    docker stop $CONTAINER && docker rm $CONTAINER
done
