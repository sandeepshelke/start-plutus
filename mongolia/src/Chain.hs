data Chain =
      GenesisBlock
    | Block Chain Txs

type Txs = Int

chain1 :: Chain
chain1 =
    Block GenesisBlock 2

chain2 :: Chain
chain2 =
    Block chain1 4

chain2' :: Chain
chain2' =
    Block (Block GenesisBlock 2) 4

chainLength :: Chain -> Int
chainLength GenesisBlock = 0
chainLength (Block c _)  = 1 + chainLength c

-- currying
hasBlock :: Txs -> Chain -> Bool
hasBlock x GenesisBlock = False
hasBlock x (Block c t) =
    x == t || hasBlock x c

-- higher order function
hasBlockProp :: (Txs -> Bool) -> Chain -> Bool
hasBlockProp prop GenesisBlock = False
hasBlockProp prop (Block c t) =
    prop t || hasBlockProp prop c


hasBlockProp' :: (Txs -> Bool) -> Chain -> Bool
hasBlockProp' prop chain =
    case chain of
        GenesisBlock -> False
        Block c t    -> prop t || hasBlockProp' prop c
