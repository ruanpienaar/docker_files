#!/bin/bash
set -e
# Usage
# export topic1=" --create --zookeeper zookeeper:2181 --replication-factor 3 --partitions 32 --topic topic1 --config min.compaction.lag.ms=21600000 --config min.cleanable.dirty.ratio=0.2 --config cleanup.policy=compact --config max.message.bytes=600000 --config segment.ms=21600000"
# export topic2=" --create --zookeeper zookeeper:2181 --replication-factor 3 --partitions 32 --topic topic2..........."
# ./kafka-topics-loop.sh "topic1 topic2"

for KAFKA_TOPIC in $KAFKA_TOPICS; do
    /kafka_2.11-2.1.0/bin/kafka-topics.sh ${!KAFKA_TOPIC} # Expands to topic configuration
done
tail -f /dev/null