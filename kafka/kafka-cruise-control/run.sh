#!/bin/bash
set -e

# TODO: zookeeper port ENV var
#       kafka broker port ENV var

#if [ -z ${BROKER_PORT+x} ]; then echo "BROKER_PORT is unset"; exit; fi
if [ -z ${ZOOKEEPER_HOSTNAME+x} ]; then echo "ZOOKEEPER_HOSTNAME is unset"; exit; fi
if [ -z ${BROKER_ID+x} ]; then echo "BROKER_ID is unset"; exit; fi
cd kafka_2.12-2.3.1 && \
#HN=`hostname`
#echo "listeners=PLAINTEXT://$HN:9092" >> config/server.properties

IP=`/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'`
echo "listeners=PLAINTEXT://$IP:9092" >> config/server.properties
echo "advertised.host.name=$IP" >> config/server.properties
echo "host.name=$IP" >> config/server.properties

echo "zookeeper.connect=$ZOOKEEPER_HOSTNAME:2181" >> config/server.properties
echo "broker.id=$BROKER_ID" >> config/server.properties
echo "Starting kafka server with properties:"
cat config/server.properties
echo "----------------------"

# He're we try and wait a bit for zookeper to allow connections
while true; do 
  if nc -z $ZOOKEEPER_HOSTNAME 2181 ; then
    echo "Zookeeper up"; 
    break;
  else
    sleep 1;
    echo "Zookeeper not up yet"; 
  fi; 
done

bin/kafka-server-start.sh config/server.properties
