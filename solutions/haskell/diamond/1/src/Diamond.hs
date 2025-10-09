module Diamond (diamond) where
import Data.Char (isAlpha, ord, chr)

diamond :: Char -> Maybe [String]
diamond 'A' = Just ["A"]
diamond c | isAlpha c = Just (aRow : upRows ++ [cRow] ++ reverse upRows ++ [aRow])
  where
    aRow = rep1 c 'A' ++ "A" ++ rep1 c 'A'
    upRows = map (\m -> rep1 c m ++ [m] ++ rep2 m ++ [m] ++ rep1 c m) ['B' .. prev c]
    cRow = c : rep2 c ++ [c]
    rep1 c m = replicate (dist c m) ' '
    rep2 c = replicate (2 * dist c 'A' - 1) ' '
    dist a b = ord a - ord b
    prev c = chr (ord c - 1)
diamond _ = Nothing