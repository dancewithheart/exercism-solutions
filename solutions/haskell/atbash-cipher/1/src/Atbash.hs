module Atbash (decode, encode) where
import Data.Char (ord, chr, isLower, toLower)

atbash :: Char -> Char
atbash x
  | isLower x = chr( (ord 'z') - ((ord x) - (ord 'a')) )
  | otherwise = x

splitAllAt :: Int -> a -> [a] -> [a]
splitAllAt n c xs
  | length xs <= n = xs
  | otherwise = let (xs1, xs2) = splitAt n xs
                in xs1 ++ (c : splitAllAt n c xs2)

decode :: String -> String
decode = (map atbash) . filter (/= ' ')

encode :: String -> String
encode = (splitAllAt 5 ' ') . (map (atbash . toLower)) . (filter (`notElem` ",. "))
