#!/bin/bash
ulimit -c unlimited

php /app/index.php

echo "PHP exited with status: $?"

shopt -s nullglob

for C in /tmp/coredump-php.*; do
    gdb /usr/local/bin/php $C
done

