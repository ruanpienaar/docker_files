FROM anapsix/alpine-java:8
ARG BROKER_PORT=9092
ENV BROKER_PORT=$BROKER_PORT
RUN wget http://apache.mirror.anlx.net/kafka/2.1.0/kafka_2.11-2.1.0.tgz && \
    tar -xvzf kafka_2.11-2.1.0.tgz && \
    cd kafka_2.11-2.1.0
RUN apk --update add bash
ADD run.sh /run.sh
ADD server.properties /kafka_2.11-2.1.0/config/server.properties
ENTRYPOINT /run.sh
EXPOSE $BROKER_PORT
