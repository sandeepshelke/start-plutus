#! /usr/bin/bash

. ../env.sh

# 79600447942433 represents hello world message converted to an Integer \
# and shortened to fit within the 8-byte limit for an int datum.

${CARDANO_CLI} transaction sign ${MAGIC} \
    --tx-body-file tx.raw \
    --signing-key-file ../exercise3/wallet.skey \
    --out-file tx.sign

${CARDANO_CLI} transaction submit ${MAGIC} \
    --tx-file tx.sign
