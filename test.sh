#!/bin/bash

echo '/tmp/coredump-%e.%p' > /proc/sys/kernel/core_pattern

ulimit -c unlimited

cd /usr/src/google-cloud-php/

vendor/bin/phpunit --group=spanner

echo "PHP exited with status: $?"

shopt -s nullglob

for C in /tmp/coredump-php.*; do
    gdb /usr/local/bin/php $C
done

