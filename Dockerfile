FROM python:2-alpine
MAINTAINER Said Sef <said@saidsef.co.uk> (http://saidsef.co.uk/)

WORKDIR /opt/cloudflare

COPY . /opt/cloudflare

RUN apk --update add make autoconf
RUN pip install -r requirements.txt
RUN cd lib/ && pyflakes .

VOLUME ["/opt/cloudflare/custom.cfg"]

ENTRYPOINT ["/opt/cloudflare/cf_api.py"]
