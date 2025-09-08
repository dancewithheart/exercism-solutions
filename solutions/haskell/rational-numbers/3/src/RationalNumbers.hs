module RationalNumbers
(Rational,
 abs,
 numerator,
 denominator,
 add,
 sub,
 mul,
 div,
 pow,
 expRational,
 expReal,
 rational) where

import Prelude hiding (div, abs, Rational)
import qualified Prelude as P

data Rational a = Rational {numerator :: a, denominator :: a} deriving(Eq, Show)

rational :: Integral a => (a, a) -> Rational a
rational ( n , d )
 | n > 0 && d < 0 = Rational { numerator = -(quot n nd), denominator = -(quot d nd) }
 | n < 0 && d < 0 = Rational { numerator = -(quot n nd), denominator = -(quot d nd) }
 | otherwise = Rational { numerator = quot n nd, denominator = quot d nd }
 where nd = gcd n d

abs :: Integral a => Rational a -> Rational a
abs (Rational n d) = rational (P.abs n, d)

add :: Integral a => Rational a -> Rational a -> Rational a
add (Rational n1 d1) (Rational n2 d2) = rational (n1*d2 + n2*d1, d1*d2)

sub :: Integral a => Rational a -> Rational a -> Rational a
sub (Rational n1 d1) (Rational n2 d2) = rational (n1*d2 - n2*d1, d1*d2)

mul :: Integral a => Rational a -> Rational a -> Rational a
mul (Rational n1 d1) (Rational n2 d2) = rational (n1*n2, d1*d2)

div :: Integral a => Rational a -> Rational a -> Rational a
div (Rational n1 d1) (Rational n2 d2) = rational (n1*d2, d1*n2)

pow :: Integral a => Rational a -> a -> Rational a
pow (Rational n d) x
  | x < 0 = rational (d ^ P.abs x, n ^ P.abs x)
  | otherwise = rational (n^x, d^x)

expRational :: Integral a => Floating b => Rational a -> b -> b
expRational (Rational a b) x = (fromIntegral a ** x) / (fromIntegral b ** x)

expReal :: Floating a => Integral b => a -> Rational b -> a
expReal x (Rational a b) = (x ** fromIntegral a) ** (1.0 / fromIntegral b)
