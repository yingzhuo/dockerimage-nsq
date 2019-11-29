#!/bin/sh

# --broadcast-address
# 广播地址,对于lookupd来说,本参数可选
if [[ -z "${BROADCAST_ADDRESS}" ]]; then
    flag_broadcast_address=""
else
    flag_broadcast_address="--broadcast-address=${BROADCAST_ADDRESS}"
fi

exec nsqlookupd \
    "${flag_broadcast_address}"