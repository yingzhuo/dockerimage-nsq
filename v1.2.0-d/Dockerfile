FROM registry.cn-shanghai.aliyuncs.com/yingzhuo/nsq:v1.2.0-base

MAINTAINER 应卓 yingzhor@gmail.com

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh

RUN chmod +x /bin/docker-entrypoint.sh

EXPOSE 4150 4151 4152

CMD ["docker-entrypoint.sh"]