FROM anapsix/alpine-java:8
RUN wget https://archive.apache.org/dist/kafka/2.4.1/kafka_2.13-2.4.1.tgz  && \
    tar -xvzf kafka_2.13-2.4.1.tgz && \
    cd kafka_2.13-2.4.1
RUN apk --update add bash
WORKDIR kafka_2.13-2.4.1
CMD CONTAINER_IP=`ifconfig eth0 | grep inet | awk '{ print $2 }' | awk -F: '{print$2'}` && \
    echo "server="$CONTAINER_IP":2181" >> config/zookeeper.properties && \
    sed -i 's/#listeners=PLAINTEXT:\/\/:9092/listeners=PLAINTEXT:\/\/'$CONTAINER_IP':9092/g' config/server.properties && \
    bin/zookeeper-server-start.sh config/zookeeper.properties > /var/log/zookeeper_localhost.log & \
    bin/kafka-server-start.sh config/server.properties
EXPOSE 2181
EXPOSE 9092