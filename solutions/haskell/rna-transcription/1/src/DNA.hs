module DNA (toRNA) where

cytosine = 'C'
guanine = 'G'
adenine = 'A'
thymine = 'T'
uracil = 'U'

complement :: Char -> Either Char Char
complement c
 | c == cytosine = Right guanine
 | c == guanine  = Right cytosine
 | c == thymine  = Right adenine
 | c == adenine  = Right uracil
 | otherwise     = Left c

toRNA :: String -> Either Char String
toRNA = traverse complement
