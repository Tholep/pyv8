FROM debian:jessie
MAINTAINER kerker <yes-reply@linux.com>

RUN apt-get update \
    && apt-get -y install wget python2.7 zip ipython libboost-all-dev python-pip

RUN wget https://github.com/emmetio/pyv8-binaries/raw/master/pyv8-linux64.zip \
  && unzip pyv8-linux64 \
  && cp _PyV8.so /usr/lib/python2.7/dist-packages/ \
  && cp PyV8.py /usr/lib/python2.7/dist-packages/
RUN apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 80
