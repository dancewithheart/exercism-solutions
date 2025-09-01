module Anagram (anagramsFor) where

import Data.List (sort)
import Data.Char (toUpper)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter (isAnagram xs) xss
  where
   isAnagram xs ys = (upper xs) /= (upper ys) && (eqIgnoreCase ys) 
   eqIgnoreCase ys = uxs == (unified ys)
   unified xs = sort $ upper xs
   upper = map toUpper
   uxs = unified xs
   upxs = upper xs
