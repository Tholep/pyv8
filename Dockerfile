FROM debian:jessie
MAINTAINER kerker <yes-reply@linux.com>

RUN apt-get update \
    && apt-get -y install wget python2.7 zip libboost-all-dev

WORKDIR /tmp
RUN wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate \
    && python get-pip.py

RUN wget https://github.com/emmetio/pyv8-binaries/raw/master/pyv8-linux64.zip \
  && unzip pyv8-linux64 \
  && cp _PyV8.so /usr/lib/python2.7/dist-packages/ \
  && cp PyV8.py /usr/lib/python2.7/dist-packages/
RUN apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
