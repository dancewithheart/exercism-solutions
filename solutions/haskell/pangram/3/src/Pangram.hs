module Pangram (isPangram) where

import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text  = all containsInText ['a' .. 'z']
   where
     containsInText :: Char -> Bool
     containsInText x = x `elem` (map toLower text)
