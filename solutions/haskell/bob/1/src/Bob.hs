module Bob (responseFor) where

import Data.Char (isUpper, isLower, isSymbol, isDigit, isPunctuation, isSpace)
import Data.List (dropWhileEnd)

trim = dropWhileEnd isSpace . dropWhile isSpace

responseFor :: String -> String
responseFor xs
 | isCaps xs && (isQuestion xs) && (hasChars xs) = "Calm down, I know what I'm doing!"
 | (isCaps xs) && (hasChars xs) = "Whoa, chill out!"
 | isQuestion (trim xs) = "Sure."
 | all isSpace xs = "Fine. Be that way!"
 | otherwise = "Whatever."
 where
   hasChars = any (\x -> isUpper x || (isLower x))
   isQuestion xs = not (null xs) && (last xs) == '?'
   isCaps = all isUpperChar
   isUpperChar x = (isSymbol x) || (isDigit x) || (isUpper x) || (isPunctuation x) || (isSpace x)
   
