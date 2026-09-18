#! /usr/bin/bash

. ./env.sh

PAYMENT_ADDR=$(cat payment.addr)
WALLET_ADDR=addr_test1qpy8klk2y34fddcumkg3gg6w3dgx2a6r38ls03kt353glkxm29swkyrm72cs2ypf5we7sq69y0ntezg46y9fcw4smqrqaf098k
TXIN=7a73d97d335aae2846520cf353adcf7c59fd6e35773bf655bcf60549563fa536#0
CURRENT_SLOT=$(${CARDANO_CLI} query tip --testnet-magic 8 | jq -r '.slot')

AMOUNT=10000000

${CARDANO_CLI} transaction build \
    --alonzo-era ${MAGIC} \
    --tx-in ${TXIN} \
    --tx-out ${WALLET_ADDR}+${AMOUNT} \
    --change-address ${PAYMENT_ADDR} \
    --witness-override 2 \
    --protocol-params-file pparams.json \
    --out-file tx.raw

# https://github.com/input-output-hk/Alonzo-testnet/blob/main/Alonzo-solutions/exercise3/e3SampleSolution.md
# the order of input and outputs is important
# In this case we want the script address to get funds and a datum,
# therefore we first use --tx-out ${SCRIPT_ADDR}+10000000000
# followed by --tx-out-datum-hash ${SCRIPT_DATUM_HASH}
