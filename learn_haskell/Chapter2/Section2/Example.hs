module Section2.Example where

firstOrEmpty lst = if not (null lst) then head lst else "empty"

-- https://github.com/Apress/practical-haskell/blob/master/Chapter02.hs
