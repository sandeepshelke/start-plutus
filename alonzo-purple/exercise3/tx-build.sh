#! /usr/bin/bash

. ../env.sh

SRC_WALLET_ADDR=$(cat ../payment.addr)
WALLET_ADDR=$(cat wallet.addr)
WALLET_STAKE_ADDR=$(cat stake.addr)
TXIN=$(${CARDANO_CLI} query utxo --address ${SRC_WALLET_ADDR} ${MAGIC} | awk 'END{print $1 "#" $2}')
CURRENT_SLOT=$(${CARDANO_CLI} query tip --testnet-magic 8 | jq -r '.slot')
AMOUNT=1500000000

${CARDANO_CLI} transaction build \
    --tx-in ${TXIN} \
    --tx-out ${WALLET_ADDR}+${AMOUNT} \
    --change-address ${WALLET_ADDR} \
    --invalid-hereafter $(( ${CURRENT_SLOT} + 100000)) \
    --withdrawal ${WALLET_STAKE_ADDR}+${AMOUNT} \
    --alonzo-era ${MAGIC} \
    --witness-override 2 \
    --out-file tx.raw
