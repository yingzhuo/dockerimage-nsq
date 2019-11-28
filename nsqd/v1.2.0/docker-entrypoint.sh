#!/bin/sh

set -e

docktool --quiet wait -w="${LOOKUPD_TCP_ADDRESS}"

mkdir -p ${DATA_PATH}

exec nsqd --lookupd-tcp-address=${LOOKUPD_TCP_ADDRESS} --data-path=${DATA_PATH}