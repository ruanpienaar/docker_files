FROM anapsix/alpine-java
RUN wget http://apache.mirror.anlx.net/kafka/2.1.0/kafka_2.11-2.1.0.tgz && \
    tar -xvzf kafka_2.11-2.1.0.tgz && \
    cd kafka_2.11-2.1.0
    
RUN echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    apk --no-cache --update --available upgrade
    
RUN apk --update add bash ca-certificates git make curl clang m4 ncurses ncurses-libs openssl perl g++ \
    openssl-dev unixodbc-dev zlib-dev dpkg-dev dpkg binutils build-base perl-dev joe
    
RUN wget https://invisible-mirror.net/archives/ncurses/ncurses-6.1.tar.gz && \
    tar -xvzf ncurses-6.1.tar.gz && \
    cd ncurses-6.1 && \
    ./configure && \
    make && \
    make install

RUN curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl && \
    chmod +x kerl && \
    mv kerl /usr/local/bin

RUN kerl build 21.2 && \
    kerl build 20.1

RUN kerl install 21.2 /root/erlang/21.2/ && \
    kerl install 20.1 /root/erlang/20.1/

#RUN echo ". /root/erlang/21.2/activate" >> ~/.bashrc

# TODO: build param for cloning, or copy DIR
#ADD ios_gstate /ios_gstate
#ADD ios_gstate_snapshot /ios_gstate_snapshot
ADD kafcat /kafcat

#RUN . /root/erlang/21.2/activate && make -C kafcat

#TODO: move to above
RUN apk add openssh

ENTRYPOINT cd kafka_2.11-2.1.0 && \
    bin/zookeeper-server-start.sh config/zookeeper.properties > /var/log/zookeeper_localhost.log && sleep 1 & \
    cd kafka_2.11-2.1.0 && \
    sed -i 's/#listeners=PLAINTEXT:\/\/:9092/listeners=PLAINTEXT:\/\/127.0.0.1:9092/g' /kafka_2.11-2.1.0/config/server.properties && \
    bin/kafka-server-start.sh config/server.properties > /var/log/kafka-server.log

# Zookeeper
EXPOSE 2181
# Kafka Broker
EXPOSE 9092