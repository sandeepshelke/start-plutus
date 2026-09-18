#! /usr/bin/bash

. ../env.sh

# 79600447942433 represents hello world message converted to an Integer \
# and shortened to fit within the 8-byte limit for an int datum.

${CARDANO_CLI} transaction hash-script-data \
    --script-data-value 79600447942433 > helloworld_hash.txt
