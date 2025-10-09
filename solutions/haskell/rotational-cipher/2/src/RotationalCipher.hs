module RotationalCipher (rotate) where
import Data.Char (chr, ord, isLower, isUpper)

import qualified Data.Text as T
import           Data.Text (Text)

rotate :: Int -> Text -> Text
rotate n = T.map rotateLetters
  where
    aDist = ord 'a'
    aUpDist = ord 'A'
    rotateLetters x
     | isLower x = chr ((ord x - aDist + n) `mod` 26 + aDist)
     | isUpper x = chr ((ord x - aUpDist + n) `mod` 26 + aUpDist)
     | otherwise = x
