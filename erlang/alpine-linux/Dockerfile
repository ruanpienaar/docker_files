FROM registry.hub.docker.com/library/alpine

RUN apk --update add curl make git wget gcc m4 g++ openssl-dev perl ncurses ncurses-dev &&\
    rm -rf /var/cache/apk/*

RUN wget https://raw.githubusercontent.com/kerl/kerl/master/kerl -O /usr/bin/kerl &&\
    chmod +x /usr/bin/kerl &&\
    kerl update releases &&\
    kerl build 21.2 21.2 &&\
    mkdir -p /root/erlang/21.2 &&\
    kerl install 21.2 /root/erlang/21.2 &&\
    echo ". /root/erlang/21.2/activate" >> ~/.bashrc
