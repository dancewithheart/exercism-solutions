module Scrabble (scoreLetter, scoreWord) where
import Data.Char (toLower)

scoreLetter :: Char -> Integer
scoreLetter letter
 | toLower letter `elem` ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'] = 1
 | toLower letter `elem` ['d', 'g'] = 2
 | toLower letter `elem` ['b', 'c', 'm', 'p'] = 3
 | toLower letter `elem` ['f', 'h', 'v', 'w', 'y'] = 4
 | toLower letter == 'k' = 5
 | toLower letter `elem` ['j', 'x'] = 8
 | toLower letter `elem` ['z', 'q'] = 10
scoreLetter _ = 0

scoreWord :: String -> Integer
scoreWord = sum . map scoreLetter