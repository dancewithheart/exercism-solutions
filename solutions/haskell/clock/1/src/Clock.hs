module Clock (addDelta, fromHourMin, toString) where

import Prelude hiding (min)

data Clock = Clock {hour :: Int, minute :: Int}
  deriving (Eq, Show)

fromHourMin :: Int -> Int -> Clock
fromHourMin hour minute = Clock {hour = (hour + minute `div` 60) `mod` 24, minute = minute `mod` 60}

toString :: Clock -> String
toString Clock {hour = h, minute = m} =  pad0 h <> ":" <> pad0 m

pad0 :: Int -> String
pad0 n
 | n < 10 = "0" <> show n
 | otherwise = show n

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour minute Clock {hour = h, minute = m} = fromHourMin (hour + h) (minute + m)
