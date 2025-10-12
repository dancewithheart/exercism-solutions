module DND ( Character(..)
           , ability
           , modifier
           , character
           ) where

import Test.QuickCheck (Gen, chooseInt)
import Data.Foldable()
import Control.Monad (replicateM)

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

rollDice6 :: Gen Int
rollDice6 = chooseInt (1, 6)

ability :: Gen Int
ability = do
  rolls <- replicateM 4 rollDice6
  let minRoll = minimum rolls
  return (sum rolls - minRoll)

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