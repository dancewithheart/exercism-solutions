module Triangle (TriangleType(..), triangleType) where

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c
  | not (isValid a b c) = Illegal
  | isEquilateral a b c = Equilateral
  | isIsosceles a b c = Isosceles
  | otherwise = Scalene
  where
    isValid a b c = (a + b >= c) && (a + c >= b) && (b + c >= a) && (a*b*c > 0)
    isEquilateral a b c = a == b && b == c
    isIsosceles a b c = (a == b) || (a == c) || (b == c)
  
