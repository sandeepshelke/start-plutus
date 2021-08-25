#! /usr/bin/bash

export CARDANO_NODE_SOCKET_PATH=state-node-alonzo-purple/node.socket
CARDANO_CLI=../result/alonzo-purple/cardano-cli/bin/cardano-cli

${CARDANO_CLI} address key-gen \
--verification-key-file payment.vkey \
--signing-key-file payment.skey

${CARDANO_CLI} stake-address key-gen \
--verification-key-file stake.vkey \
--signing-key-file stake.skey

${CARDANO_CLI} address build \
--payment-verification-key-file payment.vkey \
--stake-verification-key-file stake.vkey \
--out-file payment.addr \
--testnet-magic 8

echo "Payment address: " $(cat payment.addr)

${CARDANO_CLI} stake-address build \
--stake-verification-key-file stake.vkey \
--out-file stake.addr \
--testnet-magic 8

echo "Staing address: " $(cat stake.addr)
