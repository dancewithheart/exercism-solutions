module Isogram (isIsogram) where

import Data.Char (isAlpha, toUpper)

isIsogram :: String -> Bool
isIsogram xs = hasDups (filter isAlpha (map toUpper xs))
  where
    hasDups [] = True
    hasDups (x : xs) = notElem x xs && hasDups xs
