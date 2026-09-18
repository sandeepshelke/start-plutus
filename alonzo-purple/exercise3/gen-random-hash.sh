#! /usr/bin/bash

. ../env.sh

${CARDANO_CLI} transaction hash-script-data \
    --script-data-value $(cat randum_datum.txt) \
    > random_datum_hash.txt
