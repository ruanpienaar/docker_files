#!/bin/bash
echo $ZOOKEEPER_HOSTNAME
echo hostname
cd kafka_2.11-2.1.0 && \
HN=`hostname` && \
sed -i 's/#listeners=PLAINTEXT:\/\/:9092/listeners=PLAINTEXT:\/\/'$HN':9092/g' config/server.properties && \
sed -i 's/zookeeper.connect=localhost:2181/zookeeper.connect='$ZOOKEEPER_HOSTNAME':2181/g' config/server.properties && \
cat config/server.properties && \
bin/kafka-server-start.sh config/server.properties


#HN=`echo $ZOOKEEPER_HOSTNAME` && \


#  zookeeper.connect=localhost:2181

# sed -i 's/#listeners=PLAINTEXT:\/\/:9092/listeners=PLAINTEXT:\/\/'$HN':9092/g' config/server.properties && \