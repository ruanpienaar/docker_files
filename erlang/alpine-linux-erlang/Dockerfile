FROM registry.hub.docker.com/library/alpine
ARG ERLANG_VSN=21.2
ARG KERL_CONFIGURE_OPTIONS=""
ENV KERL_CONFIGURE_OPTIONS="${KERL_CONFIGURE_OPTIONS}"
RUN apk --update add curl make git wget gcc m4 g++ openssl-dev perl ncurses ncurses-dev &&\
    rm -rf /var/cache/apk/*
RUN wget https://raw.githubusercontent.com/kerl/kerl/master/kerl -O /usr/bin/kerl &&\
    chmod +x /usr/bin/kerl &&\
    kerl update releases &&\
    echo "-----------------------" &&\
    echo "KERL_CONFIGURE_OPTIONS: $KERL_CONFIGURE_OPTIONS" &&\
    echo "ERLANG_VSN: $ERLANG_VSN" &&\
    echo "-----------------------" &&\
    kerl build $ERLANG_VSN $ERLANG_VSN &&\
    mkdir -p /root/erlang/$ERLANG_VSN &&\
    kerl install $ERLANG_VSN /root/erlang/$ERLANG_VSN &&\
    echo ". /root/erlang/$ERLANG_VSN/activate" >> ~/.bashrc