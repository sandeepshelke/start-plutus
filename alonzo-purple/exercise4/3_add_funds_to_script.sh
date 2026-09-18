#! /usr/bin/bash

. ../env.sh

WALLET_ADDR=$(cat ../exercise3/wallet.addr)
SCRIPT_ADDR=$(cat helloworld.addr)
TXIN1=9169d504f550af63bab59ca58309a8efc91089e403545ace18f23d526549e14c#0
TXIN2=b11aa3f1f96a19cc3c0f8ef1121a7f71bea194c2780ea77fb78bab452d3ee768#0
# TXIN=$(${CARDANO_CLI} query utxo --address ${WALLET_ADDR} ${MAGIC} | awk 'END{print $1 "#" $2}')
AMOUNT=300000000

${CARDANO_CLI} transaction build \
    --alonzo-era ${MAGIC} \
    --tx-in ${TXIN1} \
    --tx-in ${TXIN2} \
    --tx-out ${SCRIPT_ADDR}+${AMOUNT} \
    --tx-out-datum-hash $(cat helloworld_hash.txt) \
    --change-address ${WALLET_ADDR} \
    --out-file tx.raw
