module Base (Error(..), rebase) where

import Data.List (find)

data Error a = InvalidInputBase | InvalidOutputBase | InvalidDigit a
    deriving (Show, Eq)

base10 :: Integral a => a -> [a] -> a
base10 base xs = loop base (reverse xs)
  where
    loop :: Integral a => a -> [a] -> a
    loop _ []       = 0
    loop _ (h : []) = h
    loop b (h : t) = h + b * (loop b t)

baseN :: Integral a => a -> a -> [a]
baseN base m = reverse $ loop base m
  where
    loop :: Integral a => a -> a -> [a]
    loop b n
     | n == 0    = []
     | b > n     = [n]
     | otherwise = (n `mod` b) : loop b (n `div` b)

rebase :: Integral a => a -> a -> [a] -> Either (Error a) [a]
rebase inputBase outputBase inputDigits
 | inputBase <= 1  = Left InvalidInputBase
 | outputBase <= 1 = Left InvalidOutputBase
 | otherwise = case (find (< 0) inputDigits) of
    Just x  -> Left (InvalidDigit x)
    Nothing -> case (find (>= inputBase) inputDigits) of
      Just y -> Left (InvalidDigit y)
      Nothing -> Right $ baseN outputBase (base10 inputBase inputDigits)
