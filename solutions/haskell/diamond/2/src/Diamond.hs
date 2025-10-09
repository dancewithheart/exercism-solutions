module Diamond (diamond) where
import Data.Char (isAlpha, ord, chr)

diamond :: Char -> Maybe [String]
diamond 'A' = Just ["A"]
diamond c | isAlpha c = Just (sym (aRow : upRows ++ [cRow]))
  where
    aRow = sym (rep c 'A' ++ "A")
    upRows = map (\m -> sym (rep c m ++ m : replicate (ord m - ord 'A') ' ')) ['B'..prev c]
    cRow = c : replicate (2 * (ord c - ord 'A') - 1) ' ' ++ [c]
    rep c m = replicate (ord c - ord m) ' '
    prev c = chr (ord c - 1)
    sym xs = xs ++ drop 1 (reverse xs)
diamond _ = Nothing
