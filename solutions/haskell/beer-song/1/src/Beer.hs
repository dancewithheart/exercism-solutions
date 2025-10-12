module Beer (song) where

bottlesOnWall :: Int -> String
bottlesOnWall 1 = "1 bottle of beer on the wall"
bottlesOnWall n = show n ++ " bottles of beer on the wall"

mkLine :: Int -> String
mkLine n = bottlesOnWall n ++ ", " ++ show n ++ " bottles of beer.\n" ++
       "Take one down and pass it around, " ++ bottlesOnWall (n - 1) ++ ".\n\n"

song :: String
song = concatMap mkLine [99, 98..3] ++
       bottlesOnWall 2 ++ ", 2 bottles of beer.\n\
       \Take one down and pass it around, " ++ bottlesOnWall 1 ++ ".\n\
       \\n" ++ bottlesOnWall 1 ++ ", 1 bottle of beer.\n\
       \Take it down and pass it around, no more bottles of beer on the wall.\n\
       \\n\
       \No more bottles of beer on the wall, no more bottles of beer.\n\
       \Go to the store and buy some more, " ++ bottlesOnWall 99 ++ ".\n"

