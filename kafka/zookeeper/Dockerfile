FROM anapsix/alpine-java:8
RUN wget http://apache.mirror.anlx.net/kafka/2.1.0/kafka_2.11-2.1.0.tgz && \
    tar -xvzf kafka_2.11-2.1.0.tgz && \
    cd kafka_2.11-2.1.0
RUN apk --update add bash
CMD cd kafka_2.11-2.1.0 && \
    bin/zookeeper-server-start.sh config/zookeeper.properties
EXPOSE 2181