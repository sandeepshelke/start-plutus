#!/usr/bin/bash

. ../env.sh

git clone https://github.com/input-output-hk/Alonzo-testnet.git /workspaces/plutus-docker/
cd /workspaces/plutus-docker/Alonzo-testnet/resources/plutus-sources/plutus-helloworld
cabal update
cabal build
cabal run plutus-helloworld -- 1 helloworld2.plutus
