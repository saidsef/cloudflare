FROM ubuntu:14.04
MAINTAINER Said Sef

WORKDIR /opt/cloudflare

RUN apt-get update
RUN apt-get install -yq make autoconf python-pip

COPY . /opt/cloudflare

RUN pip install -v -r requirements.txt
