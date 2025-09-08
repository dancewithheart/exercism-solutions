module ComplexNumbers
(Complex,
 conjugate,
 abs,
 exp,
 real,
 imaginary,
 mul,
 add,
 sub,
 div,
 complex) where

import Prelude hiding (div, abs, exp)
import qualified Prelude as P

-- Data definition -------------------------------------------------------------
data Complex a = Complex { real :: a, imaginary :: a } deriving(Eq, Show)

complex :: (a, a) -> Complex a
complex (r, i) = Complex { real = r, imaginary = i }

-- unary operators -------------------------------------------------------------
conjugate :: Num a => Complex a -> Complex a
conjugate n = Complex {real = real n, imaginary = -(imaginary n)}

abs :: Floating a => Complex a -> a
abs (Complex re im) = sqrt ( (re*re) + (im*im) )

exp :: Floating a => Complex a -> Complex a
exp (Complex a b) = Complex {real = ea * cos b, imaginary = ea * sin b}
  where ea = P.exp a

-- binary operators ------------------------------------------------------------
mul :: Num a => Complex a -> Complex a -> Complex a
mul (Complex a b) (Complex c d) =
  Complex { real = a*c - b*d, imaginary = a*d + b*c }

add :: Num a => Complex a -> Complex a -> Complex a
add (Complex a b) (Complex c d) = Complex{ real = a+c, imaginary = b+d }

sub :: Num a => Complex a -> Complex a -> Complex a
sub (Complex a b) (Complex c d) = Complex{ real = a-c, imaginary = b-d }

div :: Fractional a => Complex a -> Complex a -> Complex a
div (Complex u v) (Complex x y) = Complex{
    real = (u*x + v*y) / absPow2,
    imaginary = (v*x - u*y) / absPow2
    }
    where
      absPow2 = x*x + y*y
