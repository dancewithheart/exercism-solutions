module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz m
 | m > 0 = Just $ fromIntegral $ length $ collatzSeq m
 | otherwise = Nothing
 where
    collatzSeq :: Integer -> [Integer]
    collatzSeq n
      | n == 1    = []
      | otherwise = n : collatzSeq (next n)
    next n
      | even n    = n `div` 2
      | otherwise = 3*n+1 
