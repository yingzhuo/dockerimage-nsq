#!/bin/sh

set -e

if [[ -z "${LOOKUPD_TCP_ADDRESS}" ]]; then
    flag_lookupd_tcp_address=""
else
    flag_lookupd_tcp_address="--lookupd-tcp-address=${LOOKUPD_TCP_ADDRESS}"
    docktool --quiet wait -w="${LOOKUPD_TCP_ADDRESS}"
fi

if [[ -z "${BROADCAST_ADDRESS}" ]]; then
    flag_broadcast_address=""
else
    flag_broadcast_address="--broadcast-address=${BROADCAST_ADDRESS}"
fi

exec nsqd \
    --data-path=/opt/nsq/data \
    "$flag_lookupd_tcp_address" \
    "$flag_broadcast_address"
