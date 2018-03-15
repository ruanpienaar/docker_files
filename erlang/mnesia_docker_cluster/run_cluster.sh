#!/bin/bash
# $1 = Docker network name
set -e
set -x 
if [ -z `./is_image_present.sh` ]; then
    exit 1
fi
./is_network_setup.sh $1

cat cluster_config | \
while read LINE; do
    NODE=`echo $LINE | awk '{ print $1 }'`
    IP=`echo $LINE | awk '{ print $2 }'`
    ./run.sh $1 $NODE cookie $IP
done
