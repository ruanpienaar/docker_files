FROM erlang:20.3.4-alpine
ARG NODENAME=node
ARG COOKIE=cookie
ENV NODENAME=${NODENAME}
ENV COOKIE=${COOKIE}
ADD sys.config /root/
CMD cd /root/ && \
    erl -sname ${NODENAME} -setcookie ${COOKIE} -config /root/sys.config -boot start_sasl
#  -detached