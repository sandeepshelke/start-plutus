#! /usr/bin/bash

. ../env.sh

${CARDANO_CLI} transaction hash-script-data \
    --script-data-value '"Jhampya"' > helloworld_name_hash.txt
