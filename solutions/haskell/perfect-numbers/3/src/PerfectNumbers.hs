module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

aliquotSum :: Int -> [Int]
aliquotSum n = filter (\m -> n `mod` m == 0) [1 .. n `div` 2]

classify :: Int -> Maybe Classification
classify n
 | n <= 0       = Nothing
 | aliquit == n = Just Perfect
 | aliquit < n  = Just Deficient
 | aliquit > n  = Just Abundant
 where
   aliquit = sum (aliquotSum n)
