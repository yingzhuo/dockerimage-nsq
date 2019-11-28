#!/bin/sh

set -e

docktool --quiet wait -w="${LOOKUPD_HTTP_ADDRESS}"

exec nsqadmin --lookupd-http-address=${LOOKUPD_HTTP_ADDRESS}