module IsbnVerifier (isbn) where
import Data.Char (isDigit, digitToInt)

isbn :: String -> Bool
isbn xs = length digits == 10 && controlSum `mod` 11 == 0
    where
      isbn2ints ('X' : ys) = 10 : map digitToInt (filter isDigit ys)
      isbn2ints ys = map digitToInt (filter isDigit ys)
      digits = isbn2ints (reverse xs)
      controlSum = sum (zipWith (*) digits [1..])
