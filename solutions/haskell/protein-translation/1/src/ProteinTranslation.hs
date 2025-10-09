module ProteinTranslation(proteins) where

code :: String -> String
code "AUG" = "Methionine"
code "UUU" = "Phenylalanine"
code "UUC" = "Phenylalanine"
code "UUA" = "Leucine"
code "UUG" = "Leucine"
code "UCU" = "Serine"
code "UCC" = "Serine"
code "UCA" = "Serine"
code "UCG" = "Serine"
code "UAU" = "Tyrosine"
code "UAC" = "Tyrosine"
code "UGU" = "Cysteine"
code "UGC" = "Cysteine"
code "UGG" = "Tryptophan"
code "UAA" = "STOP"
code "UAG" = "STOP"
code "UGA" = "STOP"

proteins :: String -> Maybe [String]
proteins s
  | length s >= 3 = case code (take 3 s) of
     "STOP" -> Just []
     c      -> Just [c] <> proteins (drop 3 s)
  | s == "" = Just []      
