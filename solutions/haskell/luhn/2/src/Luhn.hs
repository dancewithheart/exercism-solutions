module Luhn (isValid) where
import Data.Char (digitToInt, isDigit)

isValid :: String -> Bool
isValid xs
  | length xs2 <= 1 || not (all isDigit xs2) = False
  | otherwise = div10 (sum (map doubleEven (indexed xs2)))
  where
    xs2 = filter (/= ' ') xs
    indexed xs = zip (map digitToInt (reverse xs)) [1..]
    doubleEven (x,idx) = if even idx then double9 x else x
    double9 n = if 2*n > 9 then 2*n-9 else 2*n
    div10 n = n `mod` 10 == 0
