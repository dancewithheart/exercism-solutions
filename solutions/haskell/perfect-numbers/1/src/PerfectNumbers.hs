module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

aliquotSum :: Int -> [Int]
aliquotSum n = filter (\m -> n `mod` m == 0) [1 .. n-1]

classify :: Int -> Maybe Classification
classify n
 | n <= 0       = Nothing
 | n == aliquit = Just Perfect
 | aliquit < n  = Just Deficient
 | aliquit > n  = Just Abundant
 where
   aliquit = sum (aliquotSum n)
