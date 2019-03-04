FROM ruanpienaar/kafka-bin:latest
ENV BOOTSTRAP_SERVER="localhost:9092"
ENV TOPIC="test"
ENV FROM="--from-beginning"
ADD consumer.sh /consumer.sh
ENTRYPOINT /consumer.sh
