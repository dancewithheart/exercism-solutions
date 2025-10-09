module School (School, add, empty, grade, sorted) where
import qualified Data.Map as Map
import Data.Map (Map())
import Data.List (sort)
import Data.Bifunctor (second)

newtype School = School (Map Int [String])

add :: Int -> String -> School -> School
add gradeNum student (School xs) = School (Map.insertWith (++) gradeNum [student] xs)

empty :: School
empty = School Map.empty

grade :: Int -> School -> [String]
grade gradeNum (School xs) = sort (Map.findWithDefault [] gradeNum xs)

sorted :: School -> [(Int, [String])]
sorted (School xs) = map (second sort) (Map.assocs xs)
