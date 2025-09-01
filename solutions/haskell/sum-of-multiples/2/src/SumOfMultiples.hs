module SumOfMultiples (sumOfMultiples) where

import Data.List (nub)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum (nub (concat (fmap (\n -> [n, 2*n .. limit-1]) (filter (/= 0) factors))))
