FROM anapsix/alpine-java:8
RUN wget http://apache.mirror.anlx.net/kafka/2.1.0/kafka_2.11-2.1.0.tgz && \
    tar -xvzf kafka_2.11-2.1.0.tgz && \
    cd kafka_2.11-2.1.0
RUN apk --update add bash
CMD cd kafka_2.11-2.1.0 && \
    echo "server.1=0.0.0.0:2181" >> config/zookeeper.properties && \
    bin/zookeeper-server-start.sh config/zookeeper.properties > /var/log/zookeeper_localhost.log && sleep 1 & \
    cd kafka_2.11-2.1.0 && \
    CONTAINER_IP=`ifconfig eth0 | grep inet | awk '{ print $2 }' | awk -F: '{print$2'}` && \
    sed -i 's/#listeners=PLAINTEXT:\/\/:9092/listeners=PLAINTEXT:\/\/127.0.0.1:9092/g' /kafka_2.11-2.1.0/config/server.properties && \
    bin/kafka-server-start.sh config/server.properties
EXPOSE 2181
EXPOSE 9092