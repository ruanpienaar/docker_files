FROM anapsix/alpine-java:8
RUN wget http://apache.mirror.anlx.net/kafka/2.3.1/kafka_2.12-2.3.1.tgz && \
    tar -xvzf kafka_2.12-2.3.1.tgz && \
    cd kafka_2.12-2.3.1
RUN apk --update add bash
ADD run.sh /run.sh
ADD server.properties /kafka_2.12-2.3.1/config/server.properties
ENTRYPOINT /run.sh
EXPOSE 9092
