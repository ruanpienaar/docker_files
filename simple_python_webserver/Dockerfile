FROM ubuntu:latest
RUN apt-get update && apt-get install -y git python
# CMD python -m SimpleHTTPServer 44332 ( this doesn't work that well with a browser, the default MIME
# type for any files, other than plain/text is application/octet-stream )
RUN git clone https://github.com/ruanpienaar/python
CMD cd python && ./pyserve_directory.py -p44332 -d/
EXPOSE 44332