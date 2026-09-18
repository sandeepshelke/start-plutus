
```
mkdir cardano-workspace
cd cardano-workspace

sh <(curl -L https://nixos.org/nix/install)
. ~/.nix-profile/etc/profile.d/nix.sh

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

# clone Alonzo-testnet
git clone https://github.com/input-output-hk/Alonzo-testnet.git

# close cardano node to build node and cli
git clone https://github.com/input-output-hk/cardano-node.git
cd cardano-node

nix-build -A cardano-cli -o ../alonzo-purple/cardano-cli
nix-build -A scripts.alonzo-purple.node -o ../alonzo-purple/cardano-node
cd ..

# create alonzo-purple file area
mkdir alonzo-purple
cd alonzo-purple
wget https://hydra.iohk.io/build/7189190/download/1/alonzo-purple-config.json
wget https://hydra.iohk.io/build/7189190/download/1/alonzo-purple-byron-genesis.json
wget https://hydra.iohk.io/build/7189190/download/1/alonzo-purple-shelley-genesis.json
wget https://hydra.iohk.io/build/7189190/download/1/alonzo-purple-alonzo-genesis.json
wget https://hydra.iohk.io/build/7189190/download/1/alonzo-purple-topology.json

# start that cardano-node this will take some time for first time
./cardano-node/bin/cardano-node-alonzo-purple

```

You can check that node is synced

```
# in another terminal
cd cardano-workspace/alonzo-purple
export CARDANO_NODE_SOCKET_PATH=/cardano-workspace/alonzo-purple/state-node-alonzo-purple/node.socket
./cardano-cli/bin/cardano-cli query tip --testnet-magic 8
```

this command will generate something bellow
```
    {
        "epoch": 191,
        "hash": "ef16b4302e6557cfea772d8b6f9ea228aa2a8adf69849613684dfbe2e5e89897",
        "slot": 1369826,
        "block": 64573,
        "era": "Alonzo",
        "syncProgress": "100.00"
    }

```