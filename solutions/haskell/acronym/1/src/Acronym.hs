module Acronym (abbreviate) where

import Data.Char (toUpper, isUpper)

abbreviate :: String -> String
abbreviate s = concat (map initials (tokenize s))
  where
    initials :: String -> String
    initials s
      | allUpper == []                  = [toUpper (head s)]
      | (length allUpper) == 1          = allUpper
      | (length allUpper) == (length s) = [head s]
      | otherwise                       = allUpper
      where
        allUpper = (filter isUpper s)
    tokenize :: String -> [String]
    tokenize s2 = words (replaceAll s2)
    replaceAll :: String -> String
    replaceAll xs = map replace xs
    replace :: Char -> Char
    replace x = case x of
                  '-' -> ' '
                  c -> c
