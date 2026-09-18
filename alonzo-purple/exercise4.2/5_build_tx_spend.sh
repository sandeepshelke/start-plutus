#! /usr/bin/bash

. ../env.sh

# 79600447942433 represents hello world message converted to an Integer \
# and shortened to fit within the 8-byte limit for an int datum.

${CARDANO_CLI} transaction build \
    --alonzo-era ${MAGIC} \
    --protocol-params-file ../pparams.json \
    --tx-in c92643d7ebc0eed775ccd8f094ea8f567f36fcb21db53094f8e0d37022c84b53#1 \
    --tx-in-script-file helloworld_name.plutus \
    --tx-in-datum-value '"Jhampya"' \
    --tx-in-redeemer-value '"Jhampya"' \
    --tx-in-collateral 2afae50474619420445380c8d0ada83e4a95d2cb03554533d1560edf55a54903#0 \
    --change-address $(cat ../payment.addr) \
    --out-file tx.raw
