module ResistorColors (Color(..), Resistor(..), label, ohms) where

import qualified Data.Text as T
import Data.Text (Text)

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

label :: Resistor -> Text
label r
   | n > 1000000000 = T.pack (show (n `div` 1000000000)) <> T.pack " gigaohms"
   | n > 1000000    = T.pack (show (n `div` 1000000)) <> T.pack " megaohms"
   | n > 10^3      = T.pack (show (n `div` 10^3)) <> T.pack " kiloohms"
   | otherwise      = T.pack (show n) <> T.pack " ohms"
  where
    n = ohms r

ohms :: Resistor -> Int
ohms (Resistor (c1, c2, c0)) = (fromEnum c1 * 10 + fromEnum c2) * (10 ^ fromEnum c0)
