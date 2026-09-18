#! /usr/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 wallet-name" >&2
  exit 1
fi

. ../env.sh

${CARDANO_CLI} address key-gen \
--verification-key-file $1.vkey \
--signing-key-file $1.skey

${CARDANO_CLI} stake-address key-gen \
--verification-key-file stake.vkey \
--signing-key-file stake.skey

${CARDANO_CLI} address build \
--payment-verification-key-file $1.vkey \
--stake-verification-key-file stake.vkey \
--out-file $1.addr \
${MAGIC}

echo "$1 address: " $(cat $1.addr)

${CARDANO_CLI} stake-address build \
--stake-verification-key-file stake.vkey \
--out-file stake.addr \
${MAGIC}

echo "Staing address: " $(cat stake.addr)
