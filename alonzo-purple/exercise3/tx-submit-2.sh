#! /usr/bin/bash

. ../env.sh

${CARDANO_CLI} transaction sign \
    --tx-body-file tx.raw \
    --signing-key-file wallet.skey \
    ${MAGIC} \
    --out-file tx.signed

${CARDANO_CLI} transaction submit \
    --tx-file tx.signed \
    ${MAGIC}

#[d8bb8a31:cardano.node.Mempool:Info:1110] [2021-08-28 20:29:45.62 UTC] fromList
#[("tx",Object (fromList [("txid",String "txid: TxId
# {_unTxId = SafeHash \"614f3ee7f0981265ff334975a166feb6339e3c9d7129afee4c09fd9811d35bc9\"}")]))
