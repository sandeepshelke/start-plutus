#! /usr/bin/bash

. ../env.sh

SRC_WALLET_ADDR=$(cat ../payment.addr)
WALLET_ADDR=$(cat wallet.addr)
# I think awk does not use data from env variable for pattern matching
# DATUM_HASH=$(cat random_datum_hash.txt)
# SCRIPT_ADDR=$(cat script.addr)
# TXIN=$(${CARDANO_CLI} query utxo --address ${SCRIPT_ADDR} ${MAGIC} | awk '/${DATUM_HASH}/{print $1 "#" $2}')
TXIN=b11aa3f1f96a19cc3c0f8ef1121a7f71bea194c2780ea77fb78bab452d3ee768#1
COLLATERAL=$(${CARDANO_CLI} query utxo --address ${WALLET_ADDR} ${MAGIC} | awk 'END{print $1 "#" $2}')

AMOUNT=1000000000

${CARDANO_CLI} transaction build \
    --alonzo-era ${MAGIC} \
    --tx-in ${TXIN} \
    --tx-in-script-file AlwaysSucceeds.plutus \
    --tx-in-datum-value $(cat random_datum.txt) \
    --tx-in-redeemer-value $(cat random_datum.txt) \
    --tx-in-collateral ${COLLATERAL} \
    --change-address ${WALLET_ADDR} \
    --witness-override 2 \
    --protocol-params-file pparams.json \
    --out-file tx.raw

# https://github.com/input-output-hk/Alonzo-testnet/blob/main/Alonzo-solutions/exercise3/e3SampleSolution.md
# part 3
# collateral is required if the validation of the script fails
# if script is successful then collateral is released
