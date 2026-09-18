#! /usr/bin/bash

. ./env.sh

${CARDANO_CLI} query tip ${MAGIC}
