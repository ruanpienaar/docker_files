#!/bin/bash
docker ps -a | grep mnesia_docker_cluster_example_node | awk '{print $1 }' | xargs docker stop