{-# LANGUAGE TupleSections #-}
module Sieve (primesUpTo) where

-- You should not use any of the division operations when implementing
-- the sieve of Eratosthenes.
import Prelude hiding (div, divMod, rem, quotRem, quot, (/))

primesUpTo :: Integer -> [Integer]
primesUpTo n = map fst (filter snd (mark (map (, True) [2 .. n])))
  where
    mark :: [(Integer, Bool)] -> [(Integer, Bool)]
    mark []             = []
    mark ((h,False):xs) = (h,False) : mark xs
    mark ((h,True) :xs) =
      (h,True) : mark (map (\(x,b) -> (x, b && (x `mod` h) /= 0)) xs)
