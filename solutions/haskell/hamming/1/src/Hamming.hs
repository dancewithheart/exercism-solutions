module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance [] [] = Just 0
distance [] (_ : _) = Nothing
distance (_ : _) [] = Nothing
distance (x : xs) (y : ys) = case (distance xs ys) of
    (Just n) -> Just (thisCount + n)
    Nothing  -> Nothing
  where
    thisCount = if x == y then 0 else 1
