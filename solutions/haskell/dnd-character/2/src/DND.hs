module DND ( Character(..)
           , ability
           , modifier
           , character
           ) where

import Test.QuickCheck (Gen, chooseInt)
import Data.Foldable (Foldable(minimum))

data Character = Character
  { strength     :: Int
  , dexterity    :: Int
  , constitution :: Int
  , intelligence :: Int
  , wisdom       :: Int
  , charisma     :: Int
  , hitpoints    :: Int
  }
  deriving (Show, Eq)

modifier :: Int -> Int
modifier n = (n - 10) `div` 2

rollDice6 = chooseInt (1, 6)

ability :: Gen Int
ability =
  do
  d1 <- rollDice6
  d2 <- rollDice6
  d3 <- rollDice6
  d4 <- rollDice6
  return (d1 + d2 + d3 + d4 - minimum [d1, d2, d3, d4])

character :: Gen Character
character = do
  str  <- ability
  dxt  <- ability
  stam <- ability
  int  <- ability
  wsd  <- ability
  char <- ability
  return Character
    { strength = str
    , dexterity = dxt
    , constitution = stam
    , intelligence = int
    , wisdom = wsd
    , charisma = char
    , hitpoints = 10 + modifier stam
    }