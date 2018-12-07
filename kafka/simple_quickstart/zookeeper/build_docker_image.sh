#!/bin/bash
cd "$(dirname "$0")"
docker build -t kafka_simple_quickstart_zookeeper:latest .