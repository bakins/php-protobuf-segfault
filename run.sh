#!/bin/bash
set -eu

V=$(date +%s)

docker build --quiet -t php-protobuf-segfault:$V .

docker run --rm -ti \
    --entrypoint="" \
     --privileged \
    php-protobuf-segfault:$V \
    /app/test.sh




