#!/bin/bash
cd $(dirname $0)
if [[ -z $1 || -z $2 ]]; then
    JSON="{ \"data\":["
    SEP=""
    while read domain; do
        JSON=${JSON}"$SEP{\"{#DOMAIN}\":\"${domain}\"}"
        SEP=", "
    done < domains.txt
    JSON=${JSON}"]}"
    echo ${JSON}
    exit 0
fi

URL=$1
PARAM=$2

ROW=$(cat result.cache | grep -E "^$URL")
ROWCODE=$(cat result-code.cache | grep -E "^$URL")

case $PARAM in
    "STATUS")
        echo "$ROW" | awk '{print $2;}'
    ;;
    "TTL")
        echo "$ROW" | awk '{print $3;}'
    ;;
    "HTTPCODE")
        echo "$ROWCODE" | awk '{print $2;}'
    ;;
esac
