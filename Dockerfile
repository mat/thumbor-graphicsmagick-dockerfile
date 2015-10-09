FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y python build-essential python-dev python-pip python-virtualenv

# thumbor/engine dependencies
RUN apt-get install -y graphicsmagick \
  libgraphicsmagick++1-dev \
  python2.7-dev \
  libmagick++-dev \
  libboost-python-dev \
  python-pycurl

WORKDIR /tmp
ADD requirements.txt /tmp/
RUN pip install -r requirements.txt
ADD . /tmp/

WORKDIR /tmp
EXPOSE 8080
# ENTRYPOINT "thumbor -c thumbor.conf -p 8080"
