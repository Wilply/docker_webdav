FROM alpine:latest

MAINTAINER wilply

ENV CONFIG "default"

COPY root /

WORKDIR /webdav

RUN VERSION=$(wget -qO - https://api.github.com/repos/hacdias/webdav/releases/latest|awk '/tag_name/ {print $2}'|grep -Eo "([0-9]\.?)+")

RUN wget -qO /tmp/webdav.tar.gz https://github.com/hacdias/webdav/releases/download/v${VERSION}/linux-amd64-webdav.tar.gz && \
    tar -xvf /tmp/webdav.tar.gz webdav

RUN rm -rf /tmp/*

CMD ["/webdav/run.sh"]

