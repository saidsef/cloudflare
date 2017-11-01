FROM python:2.7-alpine
MAINTAINER Said Sef <said@saidsef.co.uk> (http://saidsef.co.uk/)

WORKDIR /opt/cloudflare

COPY . /opt/cloudflare

RUN apk --update add make autoconf
RUN pip install -r requirements.txt
