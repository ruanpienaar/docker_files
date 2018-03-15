#!/bin/bash
# $1 = Docker network name : docker_net_1
# $2 = Nodename            : node@host
# $3 = Cookie              : cookie
# $4 = Ip                  : 127.0.0.1
docker run -name "mnesia_docker_cluster_example_$2" --net $1  -td -e NODENAME=$2 -e COOKIE=$3 --ip $4 mnesia_docker_cluster_example:latest