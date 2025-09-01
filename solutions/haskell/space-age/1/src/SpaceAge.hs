module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune
 deriving Show

orbitalPeriod :: Planet -> Float
orbitalPeriod Earth = 1.0
orbitalPeriod Mercury = 0.2408467
orbitalPeriod Venus = 0.61519726
orbitalPeriod Mars = 1.8808158
orbitalPeriod Jupiter = 11.862615
orbitalPeriod Saturn = 29.447498
orbitalPeriod Uranus = 84.016846
orbitalPeriod Neptune = 164.79132

secondsInYear :: Float
secondsInYear = 365.25 * 60 * 60 * 24

ageOn :: Planet -> Float -> Float
ageOn Earth seconds = seconds / secondsInYear
ageOn planet seconds = (ageOn Earth seconds) / (orbitalPeriod planet) 

