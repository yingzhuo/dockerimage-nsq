#!/bin/sh

set -e

# --lookupd-tcp-address
# lookupd服务地址,如果没有不需要向服务器注册
if [[ -z "${LOOKUPD_TCP_ADDRESS}" ]]; then
    flag_lookupd_tcp_address=""
else
    flag_lookupd_tcp_address="--lookupd-tcp-address=${LOOKUPD_TCP_ADDRESS}"
    docktool --quiet wait -w="${LOOKUPD_TCP_ADDRESS}"       # 等待lookupd启动成功
fi

# --broadcast-address
# 广播地址,至关重要
if [[ -z "${BROADCAST_ADDRESS}" ]]; then
    flag_broadcast_address=""
else
    flag_broadcast_address="--broadcast-address=${BROADCAST_ADDRESS}"
fi

# --data-path
# 当消息内存中保存不下时持久化到磁盘上,保存在此目录
mkdir -p ${DATA_PATH}
flag_data_path="--data-path=${DATA_PATH}"

exec nsqd \
    "$flag_data_path" \
    "$flag_lookupd_tcp_address" \
    "$flag_broadcast_address"
