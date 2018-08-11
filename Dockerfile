FROM python:3-alpine

ENV ELECTRUMX_VERSION=1.8.2
ENV ELECTRUMX_GITPATH=https://github.com/kyuupichan/electrumx.git

VOLUME ["/data"]

COPY repositories.txt /etc/apk/repositories
COPY pip.conf /etc/pip.conf

RUN echo 'while read line; do export $line; done < /data/env && electrumx_server' > /usr/local/bin/init && \
    chmod a+x /usr/local/bin/* && \
    apk update && \
    apk add --no-cache git build-base openssl leveldb-dev && \
    pip install aiohttp pylru plyvel && \
    git clone -b ${ELECTRUMX_VERSION} ${ELECTRUMX_GITPATH} && \
    cd electrumx && \
    python setup.py install && \
    apk del git build-base && \
    rm -rf /tmp/* && \
    adduser -h /home/electrumx -s /bin/sh -D electrumx electrumx && \
    chown electrumx:electrumx -R /data

USER electrumx

EXPOSE 50001 50002

CMD ["/bin/sh", "/usr/local/bin/init"]

