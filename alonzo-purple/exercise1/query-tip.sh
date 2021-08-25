#! /usr/bin/bash

export CARDANO_NODE_SOCKET_PATH=state-node-alonzo-purple/node.socket
CARDANO_CLI=../result/alonzo-purple/cardano-cli/bin/cardano-cli
${CARDANO_CLI} query tip --testnet-magic 8
