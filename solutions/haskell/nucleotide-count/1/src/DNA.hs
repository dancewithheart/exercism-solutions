module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, empty, insertWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts [] = Right empty
nucleotideCounts (h : t)
 | h == 'A' = fmap (\nt -> insertWith (+) A 1 nt) (nucleotideCounts t)
 | h == 'C' = fmap (\nt -> insertWith (+) C 1 nt) (nucleotideCounts t)
 | h == 'G' = fmap (\nt -> insertWith (+) G 1 nt) (nucleotideCounts t)
 | h == 'T' = fmap (\nt -> insertWith (+) T 1 nt) (nucleotideCounts t)
 | otherwise = Left ""
