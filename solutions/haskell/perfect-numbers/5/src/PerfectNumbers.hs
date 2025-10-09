module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

divisors :: Int -> [Int]
divisors n = filter (\m -> n `mod` m == 0) [1 .. n `div` 2]

aliquotSum :: Int -> Int
aliquotSum n = sum (divisors n)

classify :: Int -> Maybe Classification
classify n
 | n <= 0    = Nothing
 | otherwise = Just (pickClass n (aliquotSum n))
 where
   pickClass n aliquot
     | aliquot == n = Perfect
     | aliquot < n  = Deficient
     | aliquot > n  = Abundant
