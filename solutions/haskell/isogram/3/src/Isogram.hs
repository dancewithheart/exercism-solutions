module Isogram (isIsogram) where

import Data.Char (isAlpha, toUpper)
import Data.List (nub)

isIsogram :: String -> Bool
isIsogram xs =
  let letters = filter isAlpha (map toUpper xs)
  in letters == nub letters
