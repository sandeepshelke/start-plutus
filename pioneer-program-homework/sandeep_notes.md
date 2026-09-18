Mynotes
- open 4 tabs in terminal
- start nix-shell in all 4
- tab1 and tab2 cd into plutus-pioneer-program/code/<week>
- run cabal repl in tab1 and tab2
- tab3 and tab4 cd into plutus-playground-client
- run `plutus-playground-server` in tab3
- tun `npm start` in tab4 (https://localhost:8009/ will be available to use)


Plutus:

NOTE: plutus has own prelude. so keep in mind that they may have same signature.

Build documentation:
[guide](https://docs.plutus-community.com/docs/setup/buildDocumentation.html)


```
cd plutus
git pull # get the latest
git checkout <tag/rev> # the revision for your week
nix-build -A plutus.plutus-haddock-combined -o result/haddock
```


Setup Alonzo era cardano node
-----------------------------

following 1st purple lesson
[guide](https://github.com/input-output-hk/Alonzo-testnet/blob/main/Alonzo-exercises/alonzo-purple/1_Alonzo-purple-exercise-1.md)

[guide](https://github.com/input-output-hk/Alonzo-testnet)

```sh
# download tag 1.29.0-rc2
docker image pull inputoutput/cardano-node:1.29.0-rc2

# create local volumes
docker volume create cardano-node-data
docker volume create cardano-node-ipc

# run docker node
docker run -e NETWORK=mainnet -v cardano-node-ipc:/ipc -v cardano-node-data:/data inputoutput/cardano-node:1.29.0-rc2

# CLI
export CLI='docker run -it --entrypoint cardano-cli -e NETWORK=mainnet -e CARDANO_NODE_SOCKET_PATH=/ipc/node.socket -v cardano-node-ipc:/ipc inputoutput/cardano-node:1.29.0-rc2'

docker run -it --entrypoint bash -v node-ipc:/ipc -v cardano-node-data:/data inputoutput/cardano-node:1.29.0-rc2

docker run --name cardano-node -e NETWORK=mainnet -v cardano-node-ipc:/ipc -v cardano-node-data:/data inputoutput/cardano-node:1.29.0-rc2

docker exec -it cardano-node bash

# export TAG=alonzo-purple-1.0.2
export TAG=1.29.0-rc2

# start alonzo purple
docker run --name cardano-node \
-v cardano-node-ipc:/ipc \
-v cardano-node-data:/data \
-v /home/sandeep/prayog/cardano-node/alonzo-purple-config:/config \
inputoutput/cardano-node:${TAG} run \
-e NETWORK=testnet \
--config /config/alonzo-purple-config.json \
--topology /config/alonzo-purple-topology.json \
--socket-path /ipc/node.socket \
--port 3001

# run in bash
docker run -it --entrypoint bash \
-v cardano-node-ipc:/ipc \
-v cardano-node-data:/data \
-v /home/sandeep/prayog/cardano-node/alonzo-purple-config:/config \
inputoutput/cardano-node:${TAG}

bash-4.4# cardano-node --version
cardano-node 1.28.0 - linux-x86_64 - ghc-8.10
git rev cc78734d263d0eec2b12070380cdfea02a5a8342

cardano-node run --config /config/alonzo-purple-config.json \
--topology /config/alonzo-purple-topology.json \
--socket-path /ipc/node.socket \
--port 3001

```