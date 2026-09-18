#! /usr/bin/bash

. ../env.sh

# SRC_WALLET_ADDR=$(cat ../payment.addr)
# WALLET_ADDR=$(cat wallet.addr)
# WALLET_STAKE_ADDR=$(cat stake.addr)
# TXIN=$(${CARDANO_CLI} query utxo --address ${SRC_WALLET_ADDR} --testnet-magic 8 | awk 'END{print $1 "#" $2}')
# AMOUNT=1500000000

${CARDANO_CLI} transaction sign \
    --tx-body-file tx.raw \
    --signing-key-file ../payment.skey \
    --testnet-magic 8 \
    --out-file tx.signed

${CARDANO_CLI} transaction submit \
    --tx-file tx.signed \
    --testnet-magic 8
