mkdir workspace
cd workspace

sh <(curl -L https://nixos.org/nix/install)
. ~/.nix-profile/etc/profile.d/nix.sh

# following is used to quicken build time using cache
mkdir -p ~/.config/nix
echo \
    "substituters        = https://hydra.iohk.io https://iohk.cachix.org https://cache.nixos.org/" \
    "trusted-public-keys = hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ= iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" \
    > ~/.config/nix/nix.conf

git clone https://github.com/input-output-hk/plutus.git
cd plutus
git checkout master
nix-shell

[nix-shell] cabal update
[nix-shell] exit
cd ..
mkdir testnet

git clone https://github.com/input-output-hk/Alonzo-testnet.git
git clone https://github.com/input-output-hk/cardano-node.git

cd cardano-node
git checkout 1.30.1
nix-build -A scripts.testnet.node -o ../testnet/cardano-node
nix-build -A cardano-cli -o ../testnet/cardano-cli

cd ..
cd testnet
wget https://hydra.iohk.io/build/7366583/download/1/testnet-config.json
wget https://hydra.iohk.io/build/7366583/download/1/testnet-byron-genesis.json
wget https://hydra.iohk.io/build/7366583/download/1/testnet-shelley-genesis.json
wget https://hydra.iohk.io/build/7366583/download/1/testnet-alonzo-genesis.json
wget https://hydra.iohk.io/build/7366583/download/1/testnet-topology.json
wget https://hydra.iohk.io/build/7366583/download/1/testnet-db-sync-config.json
wget https://hydra.iohk.io/build/7366583/download/1/rest-config.json

./cardano-node/bin/cardano-node-testnet


docker run -v /home/sandeep/prayog/plutus-docker/testnet/config:/config \
    inputoutput/cardano-node run \
      --config /config/configuration.json \
      --database-path /config/state-node/db \
      --topology /config/topology.yaml \
      --socket-path /config/state-node/node.socket \
      +RTS -N2 -A16m -qg -qb \
      --disable-delayed-os-memory-return
