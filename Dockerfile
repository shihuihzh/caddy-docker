FROM alpine
MAINTAINER Howe <shihuihzh@gmail.com>

ARG CADDY_VER=0.11.0
ARG CADDY_URL=https://github.com/mholt/caddy/releases/download/v${CADDY_VER}/caddy_v${CADDY_VER}_linux_amd64.tar.gz
ENV SERVER_PORT 80


RUN apk add --no-cache --virtual curl \
                                tar && \
    mkdir -p /caddy/config && cd /caddy && \
    curl -sSL $CADDY_URL | tar xz && \
    mv caddy /usr/bin 

USER root
EXPOSE $SERVER_PORT
VOLUME ["/caddy/config"]

CMD caddy -conf /caddy/config/Caddyfile

