module Garden
    ( Plant (..)
    , garden
    , lookupPlants
    ) where

import Data.String (lines)
import Data.List (elemIndex)

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

data Garden = Garden {
  students :: [String],
  plants :: [String]
}

garden :: [String] -> String -> Garden
garden students plants = Garden {students = students, plants = lines plants}

lookupPlants :: String -> Garden -> [Plant]
lookupPlants student (Garden students plants) =
  concatMap (map toPlant . take 2 . drop idx) plants
    where
     idx = 2 * case elemIndex student students of
       Just idx -> idx
       Nothing -> error $ "Student " <> student <> " not found in " <> show students

toPlant :: Char -> Plant
toPlant 'C' = Clover
toPlant 'G' = Grass
toPlant 'R' = Radishes
toPlant 'V' = Violets
toPlant p = error $ "Unexpected plant " ++ show p
