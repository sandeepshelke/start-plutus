#! /usr/bin/bash

. ./env.sh

export ADDRESS=$(cat $1)
${CARDANO_CLI} query utxo --address $ADDRESS ${MAGIC}
