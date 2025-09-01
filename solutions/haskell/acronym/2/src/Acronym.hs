module Acronym (abbreviate) where

import Data.Char (toUpper, isUpper)

abbreviate :: String -> String
abbreviate str = concat $ map initials $ tokenize str
  where
    initials :: String -> String
    initials s
      | allUpper == []                  = [toUpper (head s)]
      | (length allUpper) == (length s) = [head s]
      | otherwise                       = allUpper
      where
        allUpper = filter isUpper s
    tokenize :: String -> [String]
    tokenize s = words $ map replace s
    replace :: Char -> Char
    replace x = case x of
                  '-' -> ' '
                  c -> c
