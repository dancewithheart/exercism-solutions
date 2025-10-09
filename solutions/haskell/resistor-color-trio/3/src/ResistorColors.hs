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
   | n > giga  = T.pack (show (n `div` giga)) <> T.pack " gigaohms"
   | n > mega  = T.pack (show (n `div` mega)) <> T.pack " megaohms"
   | n > kilo  = T.pack (show (n `div` kilo)) <> T.pack " kiloohms"
   | otherwise = T.pack (show n) <> T.pack " ohms"
  where
    n = ohms r
    kilo = 10^3
    mega = 10^6
    giga = 10^9

ohms :: Resistor -> Int
ohms (Resistor (c1, c2, c0)) = (fromEnum c1 * 10 + fromEnum c2) * (10 ^ fromEnum c0)
