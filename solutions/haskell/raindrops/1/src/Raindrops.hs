module Raindrops (convert) where
import Control.Monad ((>>=))

convert :: Int -> String
convert n
 | res /= "" = res
 | otherwise = show n
   where
    res = [(3,"Pling"), (5, "Plang"), (7, "Plong")] >>= (\(m,s) -> if n `mod` m == 0 then s else "")
