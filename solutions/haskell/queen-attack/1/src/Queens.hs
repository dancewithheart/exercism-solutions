module Queens (boardString, canAttack) where

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString white black = unlines (replaceFigure black blackQueen (replaceFigure white whiteQueen board))
  where
    blackQueen = 'B'
    whiteQueen = 'W'
    emptyLine :: String
    emptyLine = unwords (replicate 8 "_")
    board :: [String]
    board = replicate 8 emptyLine
    replaceFigure pos figure currBoard =
        case pos of
          Just (n2,m2) -> replaceWith n2 (replaceAt (2*m2) figure) currBoard
          Nothing -> currBoard

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (a1,a2) (b1,b2) = a1 == b1 || a2 == b2 || a1-a2 == b1-b2 || a1+a2 == b1+b2

replaceAt :: Int -> a -> [a] -> [a]
replaceAt n x = replaceWith n (const x)

replaceWith :: Int -> (a -> a) -> [a] -> [a]
replaceWith n f xs = take n xs ++ (f (xs !! n) : drop (n + 1) xs)
