FROM registry.cn-shanghai.aliyuncs.com/yingzhuo/busybox:1.31.1

MAINTAINER 应卓 yingzhor@gmail.com

ENV \
    NSQ_HOME=/opt/nsq \
    NSQ_VERSION=v1.2.0

ARG DOWNLOAD_LINK="https://s3.amazonaws.com/bitly-downloads/nsq/nsq-1.2.0.linux-amd64.go1.12.9.tar.gz"
ARG TGZ="/opt/nsq-1.2.0.linux-amd64.go1.12.9.tar.gz"

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN mkdir -p /opt && \
    wget ${DOWNLOAD_LINK} -O ${TGZ} && \
    chmod +x /bin/docker-entrypoint.sh && \
    tar -zxf ${TGZ} -C /opt && \
    mv /opt/nsq-1.2.0.linux-amd64.go1.12.9 ${NSQ_HOME} && \
    rm -rf ${TGZ} && \
    rm -rf ${NSQ_HOME}/bin/nsq_stat \
            ${NSQ_HOME}/bin/nsq_tail \
            ${NSQ_HOME}/bin/nsq_to_file \
            ${NSQ_HOME}/bin/nsq_to_http \
            ${NSQ_HOME}/bin/nsq_to_nsq \
#            ${NSQ_HOME}/bin/nsqadmin \
            ${NSQ_HOME}/bin/nsqd \
            ${NSQ_HOME}/bin/nsqlookupd \
            ${NSQ_HOME}/bin/to_nsq

ENV PATH=$PATH:${NSQ_HOME}/bin \
    LOOKUPD_HTTP_ADDRESS="nsqlookupd:4161"

EXPOSE 4171

CMD ["docker-entrypoint.sh"]