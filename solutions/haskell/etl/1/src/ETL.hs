module ETL (transform) where

import Data.Map (Map, empty, foldrWithKey, union, fromList)
import Data.Char (toLower)

transform :: Map a String -> Map Char a
transform = foldrWithKey (\n str soFar -> soFar `union` fromList (map (\c -> (toLower c, n)) str)) empty
