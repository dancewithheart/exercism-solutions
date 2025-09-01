module Pangram (isPangram) where

import Data.Char (toLower)


isPangram :: String -> Bool
isPangram text  = and (map containsInText ['A' .. 'Z'])
   where
     containsInText :: Char -> Bool
     containsInText x = (elem (toLower x) text) || (elem x text) 
