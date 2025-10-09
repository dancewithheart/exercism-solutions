module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a = Empty | Head a (LinkedList a) deriving (Eq, Show)

datum :: LinkedList a -> a
datum (Head a _) = a

fromList :: [a] -> LinkedList a
fromList = foldr Head Empty

isNil :: LinkedList a -> Bool
isNil Empty = True
isNil _     = False

new :: a -> LinkedList a -> LinkedList a
new = Head

next :: LinkedList a -> LinkedList a
next Empty         = Empty
next (Head a rest) = rest

nil :: LinkedList a
nil = Empty

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList xs = fromList (reverse (toList xs))

toList :: LinkedList a -> [a]
toList Empty = []
toList (Head a rest) = a : toList rest
