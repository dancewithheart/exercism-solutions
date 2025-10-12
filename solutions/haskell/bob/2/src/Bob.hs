module Bob (responseFor) where

import Data.Char (isUpper, isAlpha, isSymbol, isDigit, isPunctuation, isSpace)
import Data.List (dropWhileEnd)

trim :: [Char] -> [Char]
trim = dropWhileEnd isSpace . dropWhile isSpace

responseFor :: String -> String
responseFor xs
 | isCaps xs && isQuestion xs && hasChars xs = "Calm down, I know what I'm doing!"
 | isCaps xs && hasChars xs = "Whoa, chill out!"
 | isQuestion (trim xs) = "Sure."
 | all isSpace xs = "Fine. Be that way!"
 | otherwise = "Whatever."
 where
   hasChars = any isAlpha
   isQuestion ys = not (null ys) && last ys == '?'
   isCaps = all isUpperChar
   isUpperChar x = isSymbol x || isDigit x || isUpper x || isPunctuation x || isSpace x
   
