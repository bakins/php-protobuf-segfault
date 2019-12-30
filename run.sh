#!/bin/bash
set -eu

V=$(date +%s)

docker build --quiet -t php-protobuf-segfault:$V .

docker run --rm -ti \
    -v "$GOOGLE_APPLICATION_CREDENTIALS":"$GOOGLE_APPLICATION_CREDENTIALS" \
    -e GOOGLE_APPLICATION_CREDENTIALS="$GOOGLE_APPLICATION_CREDENTIALS" \
    -e SPANNER_INSTANCE=$SPANNER_INSTANCE \
    -e SPANNER_DATABASE=$SPANNER_DATABASE \
    --entrypoint="" \
    php-protobuf-segfault:$V /app/php.sh




