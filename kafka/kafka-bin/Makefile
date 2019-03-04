build:
	@ls kafka_2.11-2.1.0 || wget http://apache.mirror.anlx.net/kafka/2.1.0/kafka_2.11-2.1.0.tgz
	@ls kafka_2.11-2.1.0 || tar -xvzf kafka_2.11-2.1.0.tgz
	@docker build -t kafka-bin .