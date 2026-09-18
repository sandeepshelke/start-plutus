#! /usr/bin/bash

. ../env.sh

${CARDANO_CLI} transaction sign ${MAGIC} \
    --tx-body-file tx.raw \
    --signing-key-file ../exercise3/wallet.skey \
    --out-file tx.signed

${CARDANO_CLI} transaction submit ${MAGIC} \
    --tx-file tx.signed
