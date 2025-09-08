module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

aliquotSum :: Int -> [Int]
aliquotSum n = filter (\m -> n `mod` m == 0) [1 .. n `div` 2]

classify :: Int -> Maybe Classification
classify n
 | n <= 0       = Nothing
 | aliquot == n = Just Perfect
 | aliquot < n  = Just Deficient
 | aliquot > n  = Just Abundant
 where
   aliquot = sum (aliquotSum n)
