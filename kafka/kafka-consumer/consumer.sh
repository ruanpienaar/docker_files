#!/bin/bash
env
if [ -z ${BOOTSTRAP_SERVER+x} ]; then echo "BOOTSTRAP_SERVER is unset"; exit; fi
if [ -z ${TOPIC+x} ]; then echo "TOPIC is unset"; exit; fi
if [ -z ${FROM+x} ]; then echo "BOOTSTRAP_SERVER is unset"; exit; fi
/kafka_2.11-2.1.0/bin/kafka-console-consumer.sh --bootstrap-server $BOOTSTRAP_SERVER --topic $TOPIC $FROM