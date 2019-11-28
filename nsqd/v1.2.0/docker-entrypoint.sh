#!/bin/sh

set -e

docktool --quiet wait -w="${LOOKUPD_TCP_ADDRESS}"

# --lookupd-tcp-address
if [[ -z "${LOOKUPD_TCP_ADDRESS}" ]]; then
    flag_lookupd_tcp_address=""
else
    flag_lookupd_tcp_address="--lookupd-tcp-address=${LOOKUPD_TCP_ADDRESS}"
fi

# --data-path
if [[ -z "${DATA_PATH}" ]]; then
    flag_data_path=""
else
    mkdir -p ${DATA_PATH}
    flag_data_path="--data-path=${DATA_PATH}"
fi

# --broadcast-address
if [[ -z "${BROADCAST_ADDRESS}" ]]; then
    flag_broadcast_address=""
else
    flag_broadcast_address="--broadcast-address=${BROADCAST_ADDRESS}"
fi

exec nsqd "$flag_data_path" "$flag_lookupd_tcp_address" "$flag_broadcast_address"
