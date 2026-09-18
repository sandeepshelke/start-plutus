#!/usr/bin/bash

. ../env.sh

${CARDANO_CLI} address build \
    --payment-script-file helloworld_name.plutus \
    ${MAGIC} \
    --out-file helloworld_name.addr

${CARDANO_CLI} query utxo ${MAGIC} \
    --address $(cat helloworld_name.addr)
