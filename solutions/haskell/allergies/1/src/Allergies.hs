module Allergies (Allergen(..), allergies, isAllergicTo) where

data Allergen = Eggs
              | Peanuts
              | Shellfish
              | Strawberries
              | Tomatoes
              | Chocolate
              | Pollen
              | Cats
              deriving (Eq, Show)

allergies :: Int -> [Allergen]
allergies score
 | score >= 2^7 = allergies (score - 2^7) ++ [Cats]
 | score >= 2^6 = allergies (score - 2^6) ++ [Pollen]
 | score >= 2^5 = allergies (score - 2^5) ++ [Chocolate]
 | score >= 2^4 = allergies (score - 2^4) ++ [Tomatoes]
 | score >= 2^3 = allergies (score - 2^3) ++ [Strawberries]
 | score >= 2^2 = allergies (score - 2^2) ++ [Shellfish]
 | score >= 2^1 = allergies (score - 2^1) ++ [Peanuts]
 | score >= 2^0 = [Eggs]
 | otherwise = []

isAllergicTo :: Allergen -> Int -> Bool
isAllergicTo allergen score = allergen `elem` allergies score
