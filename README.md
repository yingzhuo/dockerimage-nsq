# dockerimage-nsq

**警告**: ⚠️ 本项目并没有经过严格测试，不可用于生产环境。

```yaml
version: "3.7"

services:
  nsqlookupd:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/nsq:v1.2.0-lookup"
    container_name: "nsqlookupd"
    restart: "always"
    hostname: "nsqlookupd"
    networks:
    - "nsq-cluster-network"
    ports:
    - "4160:4160"
    - "4161:4161"
    environment:
    - "BROADCAST_ADDRESS:192.168.99.114"

  nsqd:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/nsq:v1.2.0-d"
    container_name: "nsqd"
    restart: "always"
    hostname: "nsqd"
    networks:
    - "nsq-cluster-network"
    ports:
    - "4150:4150"
    - "4151:4151"
    environment:
    - "BROADCAST_ADDRESS=192.168.99.114"
    - "LOOKUPD_TCP_ADDRESS=nsqlookupd:4160"
    volumes:
    - "${PWD}/data/nsqd/:/opt/nsq/data/"

  nsqadmin:
    image: "registry.cn-shanghai.aliyuncs.com/yingzhuo/nsq:v1.2.0-admin"
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
