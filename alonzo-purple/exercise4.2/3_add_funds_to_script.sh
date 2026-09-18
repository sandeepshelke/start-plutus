#! /usr/bin/bash

. ../env.sh

WALLET_ADDR=$(cat ../payment.addr)
SCRIPT_ADDR=$(cat helloworld_name.addr)
DATUM_HASH=$(cat helloworld_name_hash.txt)
TXIN=$(${CARDANO_CLI} query utxo --address ${WALLET_ADDR} ${MAGIC} | awk 'END{print $1 "#" $2}')
AMOUNT=1000000000

${CARDANO_CLI} transaction build \
    --alonzo-era ${MAGIC} \
    --tx-in ${TXIN} \
    --tx-out ${SCRIPT_ADDR}+${AMOUNT} \
    --tx-out-datum-hash ${DATUM_HASH} \
    --change-address ${WALLET_ADDR} \
    --out-file tx.raw
