#!/bin/bash
URL=$1

if curl https://$URL/ &> /dev/null ; then
        IFS=: read -r domain port <<< "$URL"
        if [ -z "$port" ]; then port=443; fi
        EXP_DATE_STRING="$(openssl s_client -connect $domain:$port -servername  $domain </dev/null 2> /dev/null |  openssl x509 -in /dev/stdin  -noout -dates | grep notAfter | sed -e 's#notAfter=##')"
        EXP_DATE=$(date -d "$EXP_DATE_STRING" '+%s');
        CUR_DATE=$(date '+%s');
        TTL=$[ $EXP_DATE - $CUR_DATE ];
        echo -e "GOOD\t$TTL"
else
        echo -e "BAD\t0"
fi
