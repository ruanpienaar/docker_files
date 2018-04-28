#!/bin/bash
set -x
set -e
docker stack deploy -c docker-compose.yml mnesia_cluster
docker stack ls
docker service ls
docker ps -a | grep mnesia_node