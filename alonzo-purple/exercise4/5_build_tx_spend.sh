#! /usr/bin/bash

. ../env.sh

# 79600447942433 represents hello world message converted to an Integer \
# and shortened to fit within the 8-byte limit for an int datum.

${CARDANO_CLI} transaction build \
    --alonzo-era ${MAGIC} \
    --protocol-params-file ../pparams.json \
    --tx-in 13fccb5872699d8362fbe9baf44b69ecf681bafa86700646ec1b98b79d8cd1f8#1 \
    --tx-in-script-file helloworld.plutus \
    --tx-in-datum-value 79600447942433 \
    --tx-in-redeemer-value 79600447942433 \
    --tx-in-collateral 00d6b161a61943e91920765cebf0889f33562b7f4290ac612870c720d2398062#0 \
    --change-address $(cat ../exercise3/wallet.addr) \
    --out-file tx.raw
