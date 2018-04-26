#!/bin/bash
set -x
set -e
docker stack deploy -c docker-compose.yml erlang_example
docker stack ls
docker service ls
docker ps -a | grep erlang_example_node