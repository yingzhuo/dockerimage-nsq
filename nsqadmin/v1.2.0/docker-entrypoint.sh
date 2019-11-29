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

exec nsqadmin \
    "$flag_lookupd_tcp_address"
