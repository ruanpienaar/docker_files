FROM anapsix/alpine-java:8
RUN apk add gzip libxext libx11 libx11-dev libxrender libxrender-dev libxtst libxtst-dev
ADD kafkatool.sh /kafkatool.sh
ADD .kafkatool2_settings.xml /root/.kafkatool2/settings.xml
ADD .kafkatool2_connections.xml /root/.kafkatool2/connections.xml
ADD .kafkatool2_servergroups.xml /root/.kafkatool2/servergroups.xml
RUN chown root:root /kafkatool.sh && chmod +x /kafkatool.sh
RUN printf "o\n\n\n\n\n\n1\n\nn" | /kafkatool.sh && rm /kafkatool.sh
CMD /opt/kafkatool2/kafkatool && cat /opt/kafkatool2/error.log