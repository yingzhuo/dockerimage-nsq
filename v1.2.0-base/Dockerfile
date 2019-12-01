FROM busybox:1.31.1

MAINTAINER 应卓 yingzhor@gmail.com

ARG DOCKTOOL_VERSION=1.1.2

RUN mkdir -p /data && \
    wget "https://s3.amazonaws.com/bitly-downloads/nsq/nsq-1.2.0.linux-amd64.go1.12.9.tar.gz" -O "nsq.tar.gz" && \
    tar -zxf nsq.tar.gz -C . && \
    mv ./nsq-1.2.0.linux-amd64.go1.12.9/bin/nsqadmin /bin/nsqadmin && \
    mv ./nsq-1.2.0.linux-amd64.go1.12.9/bin/nsqd /bin/nsqd && \
    mv ./nsq-1.2.0.linux-amd64.go1.12.9/bin/nsqlookupd /bin/nsqlookupd && \
    rm -rf ./nsq.tar.gz ./nsq-1.2.0.linux-amd64.go1.12.9/ && \
    wget https://github.com/yingzhuo/docktool/releases/download/v${DOCKTOOL_VERSION}/docktool-linux-amd64-${DOCKTOOL_VERSION}.tar.gz -O ./docktool.tar.gz && \
    mkdir -p ./docktool/ && \
    tar -zxf ./docktool.tar.gz -C ./docktool/ && \
    cp ./docktool/docktool /bin/docktool && \
    chmod +x /bin/docktool && \
    rm -rf ./docktool/ ./docktool.tar.gz

ENV NSQ_VERSION=v1.2.0

VOLUME /data