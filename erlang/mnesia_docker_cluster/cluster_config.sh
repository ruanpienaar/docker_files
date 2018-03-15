#!/bin/bash
# $1 = IP 3 octet base : X.X.X
# $2 = Cluster Size    : 3
rm cluster_config
if [ -z "$1" ]; then
    exit 2
fi
if [ -z "$2" ]; then
    exit 3
fi
PLUS_ONE=$(($2+1))
for X in `seq 2 $PLUS_ONE`; do
    H="node$X"
    IP="$1.$X"
    echo "$H $IP" >> cluster_config
done
