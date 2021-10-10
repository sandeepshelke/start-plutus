
## Minting policy


https://docs.cardano.org/native-tokens/getting-started

### Value

It is a map from currency symbol to map of tokenname and integer

`value = (Map [currencySymbol, Map[(tokename, integer) ] ] )`

- `currencysymbol` and `tokenname` are of type `ByteString`
- are used to identify coin/token uniquely

### Asset class
It is a pair consisting of currency symbol and token name and used to identify unique token/coin

So `value` means how many units of asset class are contained in it.

### Currency Symbol

- it is hash of a script which is a minting policy script
- creates or burns token

utxo
- tx cant create or delete tokens. everything that goes in comes out except fees.
- depend on size of tx in bytes, depends on memory and steps required to execute


### Script context
- TxInfo has non zero txInfoForge value
- this non zero value is a bag of asset values
- for each currency symbol and token the minting policy script is run
- minting policy takes redeemer and context, no datum
- script purpose  is minting

Minting and burning can happen only when signed by specific signature
