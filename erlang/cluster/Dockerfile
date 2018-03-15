FROM alpine:latest
RUN apk --update add erlang
CMD epmd -daemon && \
    erl -name ${NODENAME}@`ip route get 1 | awk '{print $NF;exit}'` -setcookie ${COOKIE}