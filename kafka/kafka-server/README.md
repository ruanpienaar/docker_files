# Kafka Server

instructions:

prereq: zookeeper
i have zookeeper running on my machine in the example below.

use this if you'll use 1 broker, with port 9092:
docker build -t kafka-server .
docker run --rm -ti -e ZOOKEEPER_HOSTNAME=192.168.1.106 -e BROKER_ID=1 -e BROKER_PORT=9092 kafka-server:latest

use this if you'll be using multiple brokers:

Example: ( use docker-compose to sort the networking between the containers )
docker build -t kafka-server:broker_1 --build-arg BROKER_PORT=9092 .
docker build -t kafka-server:broker_2 --build-arg BROKER_PORT=9093 .
docker build -t kafka-server:broker_3 --build-arg BROKER_PORT=9094 .

docker run --rm -ti -e ZOOKEEPER_HOSTNAME=192.168.1.106 -e BROKER_ID=1 kafka-server:broker_1
docker run --rm -ti -e ZOOKEEPER_HOSTNAME=192.168.1.106 -e BROKER_ID=2 kafka-server:broker_2
docker run --rm -ti -e ZOOKEEPER_HOSTNAME=192.168.1.106 -e BROKER_ID=3 kafka-server:broker_3

Dockerhub:

just the latest single broker:

docker login
docker images ( to get the image id )
docker tag bb38976d03cf ruanpienaar/kafka-server:latest
docker push ruanpienaar/kafka-server:latest

Broker cluster:

( Use the image ID's from the above builds (broker_1, broker_2, broker_3 )

docker tag 2147055bc1e4 ruanpienaar/kafka-server:broker_1
docker push ruanpienaar/kafka-server:broker_1

docker tag 657b4b7cbcf1 ruanpienaar/kafka-server:broker_2
docker push ruanpienaar/kafka-server:broker_2

docker tag e6c824b55f77 ruanpienaar/kafka-server:broker_3
docker push ruanpienaar/kafka-server:broker_3