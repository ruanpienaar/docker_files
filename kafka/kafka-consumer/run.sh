#!/bin/sh
docker run --rm -ti -e BOOTSTRAP_SERVER=10.255.0.30:9092 -e TOPIC=test kafka-consumer