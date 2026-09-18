import Foreign (Int)
data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

data SearchTree k v = Tip | STNode (SearchTree k v) k v (SearchTree k v)

flatten :: Tree a -> [a]
flatten (Leaf a) = [a]
flatten (Node l r) = flatten l ++ flatten r

height :: Tree a -> Int
height (Leaf _) = 0
height (Node l r) = 1 + max (height l) (height r)
