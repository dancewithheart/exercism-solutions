module Yacht (yacht, Category(..)) where
import Data.List (find, nub, sort)

data Category = Ones
              | Twos
              | Threes
              | Fours
              | Fives
              | Sixes
              | FullHouse
              | FourOfAKind
              | LittleStraight
              | BigStraight
              | Choice
              | Yacht deriving (Enum)

yacht :: Category -> [Int] -> Int
yacht Yacht dice | length (nub dice) == 1 = 50
yacht FullHouse dice | sort (map snd (frequencies dice)) == [2,3] = sum dice
yacht FourOfAKind dice
  | sort (map snd (frequencies dice)) == [1,4] =
      case find (\x -> snd x == 4) (frequencies dice) of
        Just v -> 4 * fst v
        Nothing -> 0 
  | sort (map snd (frequencies dice)) == [5] =
    case find (\x -> snd x == 5) (frequencies dice) of
        Just v -> 4 * fst v
        Nothing -> 0
yacht LittleStraight dice | sort dice == [1,2,3,4,5] = 30
yacht BigStraight dice | sort dice == [2,3,4,5,6] = 30
yacht category dice | fromEnum category <= 5 = sum (filter (== (fromEnum category + 1)) dice)
yacht Choice dice = sum dice
yacht _ _ = 0

frequencies :: [Int] -> [(Int, Int)]
frequencies [] = []
frequencies (x:xs) = (x, length (filter (== x) (x:xs))) : frequencies (filter (/= x) xs)
