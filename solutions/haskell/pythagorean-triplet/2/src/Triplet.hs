module Triplet (tripletsWithSum) where

tripletsWithSum :: Int -> [(Int, Int, Int)]
tripletsWithSum s = [ (a,b,s - a - b) | a <- [1 .. s-2], b <- [a+1 .. s-2], a*a + b*b == (s - a - b)^2]
