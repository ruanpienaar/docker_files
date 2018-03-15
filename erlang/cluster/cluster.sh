#!/bin/bash
if [ -z `docker images erlang_node_cluster_example -q` ]; then
    exit
fi
COUNT=1
for X in `seq 10`; do
    COUNT=$(($COUNT+1))
    H="node$COUNT"
    CID=`docker run -td -e NODENAME=$H -e COOKIE=cookie -h $H erlang_node_cluster_example`
    IP=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CID`
    echo "./remsh.sh $CID node$COUNT@$IP"
done
