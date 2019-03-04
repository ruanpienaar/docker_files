#!/bin/sh
docker run --rm -ti -e BROKER_LIST=10.255.0.30:9092 -e TOPIC=topic1 ruanpienaar/kafka-producer:latest