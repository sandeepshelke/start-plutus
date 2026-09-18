type Table k v = [(k, v)]

empty :: Table k v
empty = []

insert :: k -> v -> Table k v -> Table k v
insert k v t = (k,v) : t

delete :: Eq k => k -> Table k v -> Table k v
delete k = filter (\kv -> k /= fst kv)

lookupt :: Eq k => k -> Table k v -> Maybe v
lookupt _ [] = Nothing
lookupt k ((k', v') : kvs)
    | k' == k = Just v'
    | otherwise = lookupt k kvs
