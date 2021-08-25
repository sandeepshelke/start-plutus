#! /usr/bin/bash

export CARDANO_NODE_SOCKET_PATH=state-node-alonzo-purple/node.socket
CARDANO_CLI=../result/alonzo-purple/cardano-cli/bin/cardano-cli
${CARDANO_CLI} query utxo --address $ADDRESS --testnet-magic 8
