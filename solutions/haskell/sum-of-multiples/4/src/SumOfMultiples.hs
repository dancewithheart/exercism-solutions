module SumOfMultiples (sumOfMultiples) where
import Data.List (nub)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ nub [m | n <- factors, n > 0, m <- [n, 2*n .. limit-1]]
