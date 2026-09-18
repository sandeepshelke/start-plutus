#! /usr/bin/bash

. ../env.sh

${CARDANO_CLI} query protocol-parameters ${MAGIC} > pparams.json
