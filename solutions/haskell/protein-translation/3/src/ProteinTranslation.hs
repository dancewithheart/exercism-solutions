module ProteinTranslation(proteins) where

code :: String -> Maybe String
code "AUG" = Just "Methionine"
code s | s `elem` ["UUU", "UUC"] = Just "Phenylalanine"
code s | s `elem` ["UUA", "UUG"] = Just "Leucine"
code s | s `elem` ["UCU", "UCC", "UCA", "UCG"] = Just "Serine"
code s | s `elem` ["UAU", "UAC"] = Just "Tyrosine"
code s | s `elem` ["UGU", "UGC"] = Just "Cysteine"
code "UGG" = Just "Tryptophan"
code s | s `elem` ["UAA", "UAG", "UGA"] = Nothing

proteins :: String -> Maybe [String]
proteins s
  | length s >= 3 = case code (take 3 s) of
     Nothing -> Just []
     Just c  -> Just [c] <> proteins (drop 3 s)
  | s == "" = Just []      
