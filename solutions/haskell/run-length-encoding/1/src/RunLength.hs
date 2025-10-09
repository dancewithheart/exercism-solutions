module RunLength (decode, encode) where
import Data.Char (isDigit, digitToInt)

decode :: String -> String
decode (n1:n2:x:xs)
  | isDigit n1 && isDigit n2 = replicate (10 * digitToInt n1 + digitToInt n2) x ++ decode xs
decode (n:x:xs)
  | isDigit n = replicate (digitToInt n) x ++ decode xs
  | otherwise = n : decode (x:xs)
decode xs = xs


encode :: String -> String
encode [] = []
encode (x:xs) = loop xs 1 (Just x)
  where
    loop :: [Char] -> Int -> Maybe Char -> String
    loop [] n (Just c)     = showN n c
    loop [] 0 Nothing      = []
    loop (x:xs) n (Just c)
      | x == c    = loop xs (n + 1) (Just c)
      | otherwise = showN n c ++ loop xs 1 (Just x)
    showN :: Int -> Char -> String  
    showN 1 c = [c]
    showN n c = show n <> [c]
