#! /usr/bin/bash

. ../env.sh

${CARDANO_CLI} address build \
    --payment-script-file AlwaysSucceeds.plutus \
    ${MAGIC} \
    --out-file script.addr
