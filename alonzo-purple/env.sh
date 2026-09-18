#! /usr/bin/bash

export CARDANO_NODE_SOCKET_PATH=/workspaces/plutus-docker/alonzo-purple/state-node-alonzo-purple/node.socket
CARDANO_CLI=/workspaces/plutus-docker/alonzo-purple/cardano-cli/bin/cardano-cli
MAGIC="--testnet-magic 8"
export ALONZO_TESTNET=/workspaces/plutus-docker/Alonzo-testnet/