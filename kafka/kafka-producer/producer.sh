#!/bin/bash
env
if [ -z ${BROKER_LIST+x} ]; then echo "BROKER_LIST is unset"; exit; fi
if [ -z ${TOPIC+x} ]; then echo "TOPIC is unset"; exit; fi
/kafka_2.11-2.1.0/bin/kafka-console-producer.sh --broker-list $BROKER_LIST --topic $TOPIC