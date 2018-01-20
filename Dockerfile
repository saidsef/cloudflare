FROM python:2-alpine
MAINTAINER Said Sef <said@saidsef.co.uk> (http://saidsef.co.uk/)

WORKDIR /opt/cloudflare

COPY . /opt/cloudflare

RUN apk --update add make autoconf && \
    pip install -r requirements.txt &&\
    cd lib/ && \
    pyflakes .
