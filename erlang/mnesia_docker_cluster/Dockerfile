FROM alpine:latest
RUN apk --update add make \
    erlang erlang-crypto erlang-mnesia erlang-asn1 erlang-public-key \
    erlang-ssl erlang-inets erlang-sasl erlang-syntax-tools erlang-observer \
    erlang-runtime-tools \
    git && \
    git clone https://github.com/ruanpienaar/mnesia_docker
WORKDIR mnesia_docker
ENV RUN_ERL_LOG_ALIVE_MINUTES=60
ENV RUN_ERL_LOG_MAXSIZE=10000000
ADD cluster.sys.config .
RUN mkdir pipe/
CMD make && \
    epmd -daemon && \
    run_erl -daemon pipe/ log/ "exec erl -name ${NODENAME}@`ip route get 1 | awk '{print $NF;exit}'` -setcookie ${COOKIE} -config cluster.sys.config -pa $PWD/_build/default/lib/*/ebin -s mnesia_docker start +Bi" && \
    tail -F log/erlang.log.1
