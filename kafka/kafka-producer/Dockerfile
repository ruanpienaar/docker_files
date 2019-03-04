FROM ruanpienaar/kafka-bin:latest
ENV BROKER_LIST="localhost:9092"
ENV TOPIC="test"
ADD producer.sh /producer.sh
ENTRYPOINT /producer.sh
