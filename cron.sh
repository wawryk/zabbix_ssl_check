#!/bin/bash
cd $(dirname $0)
result=$(mktemp)
result_code=$(mktemp)
(while read url; do
        echo -e "$url\t$(./sslinfo.sh $url)" >> $result
        echo -e "$url\t$(./httpcode.sh $url)" >> $result-code
done) < domains.txt

mv $result result.cache
mv $result-code result-code.cache
