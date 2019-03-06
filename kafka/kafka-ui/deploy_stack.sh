#!/bin/bash
#set -e
docker stack deploy -c docker-compose.yml local_kafka_ui
