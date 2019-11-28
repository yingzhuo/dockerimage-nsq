# dockerimage-nsq

**警告**: ⚠️ 本项目并没有经过严格测试，不可用于生产环境。

```yaml
version: "3.7"

services:
  nsqlookupd:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/nsqlookupd:v1.2.0"
    container_name: "nsqlookupd"
    restart: "always"
    hostname: "nsqlookupd"
    networks:
    - "nsq-cluster-network"
    ports:
    - "4160:4160"
    - "4161:4161"

  nsqd1:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/nsqd:v1.2.0"
    container_name: "nsqd1"
    restart: "always"
    hostname: "nsqd1"
    networks:
    - "nsq-cluster-network"
    ports:
    - "4151:4151"
    environment:
    - "LOOKUPD_TCP_ADDRESS=nsqlookupd:4160"
    volumes:
    - "${PWD}/data/nsqd1/:/opt/nsq/data/"

  nsqd2:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/nsqd:v1.2.0"
    container_name: "nsqd2"
    restart: "always"
    hostname: "nsqd2"
    networks:
    - "nsq-cluster-network"
    ports:
    - "4152:4151"
    environment:
    - "LOOKUPD_TCP_ADDRESS=nsqlookupd:4160"
    volumes:
    - "${PWD}/data/nsqd2/:/opt/nsq/data/"

  nsqd3:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/nsqd:v1.2.0"
    container_name: "nsqd3"
    restart: "always"
    hostname: "nsqd3"
    networks:
    - "nsq-cluster-network"
    ports:
    - "4153:4151"
    environment:
    - "LOOKUPD_TCP_ADDRESS=nsqlookupd:4160"
    volumes:
    - "${PWD}/data/nsqd3/:/opt/nsq/data/"

  nsqadmin:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/nsqadmin:v1.2.0"
    container_name: "nsqadmin"
    restart: "always"
    hostname: "nsqadmin"
    networks:
    - "nsq-cluster-network"
    ports:
    - "4171:4171"
    environment:
    - "LOOKUPD_HTTP_ADDRESS=nsqlookupd:4161"

networks:
  nsq-cluster-network:
    driver: bridge
```
