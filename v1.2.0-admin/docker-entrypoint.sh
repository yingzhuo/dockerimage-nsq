#!/bin/sh

set -e

if [[ -z "${LOOKUPD_HTTP_ADDRESS}" ]]; then
    flag_lookupd_http_address=""
else
    flag_lookupd_http_address="--lookupd-http-address=${LOOKUPD_HTTP_ADDRESS}"
fi

exec nsqadmin \
    "$flag_lookupd_http_address"
