FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y python build-essential python-dev python-pip

# thumbor/engine dependencies
RUN apt-get install -y graphicsmagick \
  libgraphicsmagick++1-dev \
  python2.7-dev \
  libmagick++-dev \
  libboost-python-dev \
  python-pycurl

RUN pip install thumbor
RUN pip install graphicsmagick-engine

ADD thumbor.conf /tmp/thumbor.conf

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/thumbor"]
CMD ["--port=8080", "-c", "/tmp/thumbor.conf"]
