#!/usr/bin/bash

. ../env.sh

${CARDANO_CLI} address build \
    --payment-script-file helloworld.plutus \
    ${MAGIC} \
    --out-file helloworld.addr

${CARDANO_CLI} query utxo ${MAGIC} \
    --address $(cat helloworld.addr)