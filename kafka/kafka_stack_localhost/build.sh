#!/bin/bash
cd "$(dirname "$0")"
docker build -t kafka_stack_localhost:latest .