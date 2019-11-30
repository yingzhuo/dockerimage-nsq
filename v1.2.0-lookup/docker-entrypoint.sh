#!/bin/sh

set -e

if [[ -z "${BROADCAST_ADDRESS}" ]]; then
    flag_broadcast_address=""
else
    flag_broadcast_address="--broadcast-address=${BROADCAST_ADDRESS}"
fi

exec nsqlookupd \
    "${flag_broadcast_address}"
