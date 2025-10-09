module ProteinTranslation(proteins) where

code :: String -> Maybe String
code "AUG" = Just "Methionine"
code "UUU" = Just "Phenylalanine"
code "UUC" = Just "Phenylalanine"
code "UUA" = Just "Leucine"
code "UUG" = Just "Leucine"
code "UCU" = Just "Serine"
code "UCC" = Just "Serine"
code "UCA" = Just "Serine"
code "UCG" = Just "Serine"
code "UAU" = Just "Tyrosine"
code "UAC" = Just "Tyrosine"
code "UGU" = Just "Cysteine"
code "UGC" = Just "Cysteine"
code "UGG" = Just "Tryptophan"
code "UAA" = Nothing
code "UAG" = Nothing
code "UGA" = Nothing

proteins :: String -> Maybe [String]
proteins s
  | length s >= 3 = case code (take 3 s) of
     Nothing -> Just []
     Just c  -> Just [c] <> proteins (drop 3 s)
  | s == "" = Just []      
