#!/bin/bash
if [ -z "$1" ]; then
    exit 1
fi
docker network inspect --format='{{.Name}}' $1