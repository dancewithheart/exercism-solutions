module Triplet (tripletsWithSum) where

tripletsWithSum :: Int -> [(Int, Int, Int)]
tripletsWithSum s = [ (a, b, s-a-b) | a <- [1 .. s `div` 3], b <- [a+1 .. s `div` 2], a*a + b*b == (s-a-b)^2]
