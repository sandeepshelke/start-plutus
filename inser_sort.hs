data Expr = Val Int | Div Expr Expr

x :: Expr
x = Val 1

d :: Expr
d = Div (Val 6) (Val 2)

d1 :: Expr
d1 = Div (Div (Val 12) (Val 2)) (Val 2)

-- Safediv :: Int -> Int -> Maybe Int
-- Safediv n m = if m == 0 then
--                 Nothing
--               else
--                 Just (div m n)

-- eval :: Expr -> Maybe Int
-- eval (Val n) = Just n
-- eval (Div x y) = case eval x of
--                  Nothing -> Nothing
--                  Just n -> case eval y of
--                      Nothing -> Nothing
--                      Just m -> Safediv n m

-- eval' :: Expr -> Maybe Int
-- eval' (Val n) = return n
-- eval' (Div x y) = eval' x >>= (\n ->
--                   eval' y >>= (\m ->
--                   Safediv n m))

-- eval'' :: Expr -> Maybe Int
-- eval'' (Val n) = return n
-- eval'' (Div x y) = do n <- eval'' x
--                       m <- eval'' y
--                       Safediv n m

sort :: [Int] -> [Int]
sort []      = []
sort (x:xs)  = insert x $ sort xs

insert :: Int -> [Int] -> [Int]
insert x []                  = [x]
insert x (y:ys) | x <= y     = x : y : ys
                | otherwise  = y : insert x ys

isSorted :: [Int] -> Bool
isSorted []           = True
isSorted [_]          = True
isSorted (x : y : ys) = x<= y && isSorted (y:ys)

prop_sort_sorts :: [Int] -> Bool
prop_sort_sorts xs = isSorted $ sort xs

prop_sort_preserves_length :: [Int] -> Bool
prop_sort_preserves_length xs = length (sort xs) == length xs
