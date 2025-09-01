module Grains (square, total) where

pow2 :: Integer -> Integer
pow2 n = 2 ^ (n - 1)

square :: Integer -> Maybe Integer
square n
 | n <= 0 || n > 64 = Nothing
 | otherwise        = Just (pow2 n)

total :: Integer
total = sum $ fmap pow2 [1 .. 64]
