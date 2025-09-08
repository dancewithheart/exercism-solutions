module ArmstrongNumbers (armstrong) where
import Data.Char (digitToInt)

armstrong :: Integral a => a -> Bool
armstrong x = toInteger armsNo == ix
  where
    ix = toInteger x
    digits :: [Int]
    digits = map digitToInt (show ix)
    power :: Int
    power = length digits
    armsNo :: Int
    armsNo = sum (map (^ power) digits)
