module ReverseString (reverseString) where

reverseString :: String -> String
reverseString [] = []
reverseString (h : t) = (reverseString t) ++ [h]

