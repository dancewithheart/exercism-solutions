module BST (BST, bstLeft, bstRight, bstValue, empty, fromList, insert, singleton, toList) where

data BST a = Empty | Branch a (BST a) (BST a) deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Empty = Nothing
bstLeft (Branch _ left _) = Just left

bstRight :: BST a -> Maybe (BST a)
bstRight Empty = Nothing
bstRight (Branch _ _ right) = Just right

bstValue :: BST a -> Maybe a
bstValue Empty          = Nothing
bstValue (Branch a _ _) = Just a

empty :: BST a
empty = Empty

fromList :: Ord a => [a] -> BST a
fromList = foldl (flip insert) Empty -- foldr do not require flip but break expectations in tests

insert :: Ord a => a -> BST a -> BST a
insert x Empty = singleton x
insert x (Branch a l r) = if x <= a
    then Branch a (insert x l) r
    else Branch a l (insert x r)

singleton :: a -> BST a
singleton x = Branch x Empty Empty

toList :: BST a -> [a]
toList Empty = []
toList (Branch a l r) = toList l ++ (a : toList r)
