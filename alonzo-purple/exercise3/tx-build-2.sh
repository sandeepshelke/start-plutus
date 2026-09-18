#! /usr/bin/bash

. ../env.sh

WALLET_ADDR=$(cat wallet.addr)
TXIN=$(${CARDANO_CLI} query utxo --address ${WALLET_ADDR} ${MAGIC} | awk 'END{print $1 "#" $2}')
CURRENT_SLOT=$(${CARDANO_CLI} query tip --testnet-magic 8 | jq -r '.slot')

SCRIPT_ADDR=$(cat script.addr)
SCRIPT_DATUM_HASH=$(cat random_datum_hash.txt)
AMOUNT=400000000

${CARDANO_CLI} transaction build \
    --alonzo-era ${MAGIC} \
    --tx-in ${TXIN} \
    --tx-out ${SCRIPT_ADDR}+${AMOUNT} \
    --tx-out-datum-hash ${SCRIPT_DATUM_HASH} \
    --change-address ${WALLET_ADDR} \
    --witness-override 2 \
    --protocol-params-file pparams.json \
    --out-file tx.raw

# https://github.com/input-output-hk/Alonzo-testnet/blob/main/Alonzo-solutions/exercise3/e3SampleSolution.md
# the order of input and outputs is important
# In this case we want the script address to get funds and a datum,
# therefore we first use --tx-out ${SCRIPT_ADDR}+10000000000
# followed by --tx-out-datum-hash ${SCRIPT_DATUM_HASH}
