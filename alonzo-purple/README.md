Setup and build cardano code

refer to [guide](https://github.com/input-output-hk/Alonzo-testnet/blob/main/Alonzo-solutions/exercise1/exercise1-linux-solution.md)

[Getting started](https://github.com/input-output-hk/Alonzo-testnet/blob/main/Alonzo-exercises/alonzo-purple/1_Alonzo-purple-exercise-1.md) from iokh

- setup docker image for ubuntu with nix, cabal
- inside docker get cardano code from github
- checkout latest code tag e.g. 1.29.0-rc2

```
nix-build -A cardano-cli -o ../alonzo-purple/cardano-cli
nix-build -A scripts.alonzo-purple.node -o ../alonzo-purple/cardano-node
```

[Exercise3 solution](https://github.com/input-output-hk/Alonzo-testnet/blob/main/Alonzo-solutions/exercise3/e3SampleSolution.md)

```
../cardano-cli/bin/cardano-cli transaction build \
    --tx-in 34cd8d7be607c4bc9710a16298cb3e4dc1cd5b10ff9455c472f3d0dd1e2be088#0 \
    --tx-out addr_test1qqwajh2savmwnyezulwq3eht9c809e9hjq77n5uq8c35es5lyrcgtzg0gg89640hm7fnavkd27j5cyz2d8qgn6l2rrssnlp3zc+998498000000 \
    --change-address addr_test1qqwajh2savmwnyezulwq3eht9c809e9hjq77n5uq8c35es5lyrcgtzg0gg89640hm7fnavkd27j5cyz2d8qgn6l2rrssnlp3zc \
    --invalid-hereafter $(( ${currentSlot} + 1000000)) \
    --withdrawal stake_test1ur20hkjznhrh7kcdz5t3ugrtgl5z9znx0cluud5q07gwzfg5swt9n+998498000000 \
    --alonzo-era \
    ${MAGIC} \
    --witness-override 2 \
    --out-file tx.raw
```

tx-in
-----
One or more wallet (script?) address that produces the transaction. This owner has to sign the tx with private key. This is UTXO i.e. unspent transaction output as input to this new transaction

tx-out
------
One or more output addresses. These addresses can be wallet addresses or (script?) addresses.
tx-out is formatted like `address+amount`

change-address
--------------
This is the address where the balance from the utxo will be created as a new utxo

invalid-hereafrer
-----------------
after which timeslot this tx is invalid. So as soon as that timeslot is passed the tx is unspendable. (What happens to the locked up amount? must return to the owner)

withdrawl
---------
This transaction construction specifies the stake address as "WITHDRAWAL" because the command is used when withdrawing from a staking reward address. Therefore, it cannot be used for general ADA transfer.
is formatted like `address+amount`

alonzo-era
----------


testnet-magic
-------------


witness-override
----------------
?

out-file
--------
generate the output of tx in this file