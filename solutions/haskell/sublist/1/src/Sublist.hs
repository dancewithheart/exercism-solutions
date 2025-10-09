module Sublist (sublist) where

isSublist :: Eq a => [a] -> [a] -> Bool
isSublist xs ys
  | length xs > length ys = False
  | isEq xs ys            = True
  | otherwise             = isSublist xs (tail ys)

isEq :: Eq a => [a] -> [a] -> Bool
isEq xs ys = all (uncurry (==)) (zip xs ys)

sublist :: Eq a => [a] -> [a] -> Maybe Ordering
sublist xs ys
 | (length xs == length ys) && isEq xs ys = Just EQ
 | isSublist xs ys = Just LT
 | isSublist ys xs = Just GT
 | otherwise       = Nothing
