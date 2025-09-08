module ArmstrongNumbers (armstrong) where
import Data.Char (digitToInt)

armstrong :: Integral a => a -> Bool
armstrong x = toInteger (sum (map (^ power) digits)) == ix
  where
    ix = toInteger x
    digits = map digitToInt (show ix)
    power = length digits

