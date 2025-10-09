module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Enum, Eq, Show)

data Robot = Robot Bearing (Integer, Integer) deriving (Show)

bearing :: Robot -> Bearing
bearing (Robot b _) = b

coordinates :: Robot -> (Integer, Integer)
coordinates (Robot _ xy) = xy

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot = Robot

move :: Robot -> String -> Robot
move robot "" = robot
move (Robot b pos) ('R' : xs) = move (Robot (toEnum ((fromEnum b + 1) `mod` 4)) pos) xs
move (Robot b pos) ('L' : xs) = move (Robot (toEnum ((fromEnum b - 1) `mod` 4)) pos) xs
move (Robot North (x,y)) ('A' : xs) = move (Robot North (x, y + 1)) xs
move (Robot South (x,y)) ('A' : xs) = move (Robot South (x, y - 1)) xs
move (Robot East (x,y)) ('A' : xs) = move (Robot East (x + 1, y)) xs
move (Robot West (x,y)) ('A' : xs) = move (Robot West (x - 1, y)) xs
