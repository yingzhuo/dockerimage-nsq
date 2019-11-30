FROM busybox:1.31.1

MAINTAINER 应卓 yingzhor@gmail.com

RUN mkdir -p /opt && \
    wget "https://s3.amazonaws.com/bitly-downloads/nsq/nsq-1.2.0.linux-amd64.go1.12.9.tar.gz" -O "/opt/nsq-1.2.0.linux-amd64.go1.12.9.tar.gz" && \
    tar -zxf /opt/nsq-1.2.0.linux-amd64.go1.12.9.tar.gz -C /opt && \
    mv /opt/nsq-1.2.0.linux-amd64.go1.12.9 /opt/nsq && \
    rm -rf /opt/nsq-1.2.0.linux-amd64.go1.12.9.tar.gz && \
    rm -rf /opt/nsq/bin/nsq_stat \
           /opt/nsq/bin/nsq_tail \
           /opt/nsq/bin/nsq_to_file \
           /opt/nsq/bin/nsq_to_http \
           /opt/nsq/bin/nsq_to_nsq \
           /opt/nsq/bin/to_nsq && \
    mkdir -p /opt/nsq/data && \
    wget "https://github.com/yingzhuo/docktool/releases/download/v1.1.2/docktool-linux-amd64-1.1.2" -O /bin/docktool && \
    chmod +x /bin/docktool

ENV \
    NSQ_VERSION=v1.2.0 \
    NSQ_HOME=/opt/nsq \
    PATH=${PATH}:${NSQ_HOME}/bin

VOLUME /opt/nsq/data

CMD ["docktool", "sleep"]