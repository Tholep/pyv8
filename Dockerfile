FROM debian:jessie
MAINTAINER kerker <yes-reply@linux.com>

RUN apt-get update \
    && apt-get -y install wget python2.7 zip ipython libboost-all-dev apache2 \
    && echo "ServerName localhost" >> /etc/apache2/apache2.conf \
    && sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf 

RUN wget https://github.com/emmetio/pyv8-binaries/raw/master/pyv8-linux64.zip \
  && unzip pyv8-linux64 \
  && cp _PyV8.so /usr/lib/python2.7/dist-packages/ \
  && cp PyV8.py /usr/lib/python2.7/dist-packages/


CMD ["apache2ctl", "-D", "FOREGROUND"]
