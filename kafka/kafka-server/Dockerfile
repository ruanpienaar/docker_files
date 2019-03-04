FROM anapsix/alpine-java:8
RUN wget http://apache.mirror.anlx.net/kafka/2.1.0/kafka_2.11-2.1.0.tgz && \
    tar -xvzf kafka_2.11-2.1.0.tgz && \
    cd kafka_2.11-2.1.0
RUN apk --update add bash
ADD run.sh /run.sh
# Stop creating topics, with 1 partition automatically....
#RUN echo "" >> /kafka_2.11-2.1.0/config/server.properties && \
#    echo "auto.create.topics.enable=false" >> /kafka_2.11-2.1.0/config/server.properties
ADD server.properties /kafka_2.11-2.1.0/config/server.properties
EXPOSE 9092