FROM registry.hub.docker.com/library/alpine
ARG GIT_ERLANG_TAG=OTP-21.3.8
ARG KERL_CONFIGURE_OPTIONS=""
ENV KERL_CONFIGURE_OPTIONS="${KERL_CONFIGURE_OPTIONS}"
RUN apk --update add curl make git wget gcc m4 g++ openssl-dev perl ncurses ncurses-dev musl musl-dev autoconf &&\
    rm -rf /var/cache/apk/*
RUN wget https://raw.githubusercontent.com/kerl/kerl/master/kerl -O /usr/bin/kerl &&\
    chmod +x /usr/bin/kerl &&\
    kerl update releases &&\
    echo "-----------------------" &&\
    echo "KERL_CONFIGURE_OPTIONS: $KERL_CONFIGURE_OPTIONS" &&\
    echo "GIT_ERLANG_TAG: $GIT_ERLANG_TAG" &&\
    echo "-----------------------" &&\
    kerl build git https://github.com/erlang/otp.git $GIT_ERLANG_TAG $GIT_ERLANG_TAG &&\
    mkdir -p /root/erlang/$GIT_ERLANG_TAG &&\
    kerl install $GIT_ERLANG_TAG /root/erlang/$GIT_ERLANG_TAG &&\
    echo ". /root/erlang/$GIT_ERLANG_TAG/activate" >> ~/.bashrc