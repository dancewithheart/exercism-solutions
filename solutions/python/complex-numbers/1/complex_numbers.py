import math
import numbers

class ComplexNumber:
  def __init__(self, real, imaginary):
    self.real = real
    self.imaginary = imaginary

  def __eq__(self, other):
    if isinstance(other, ComplexNumber):
      return (self.real == other.real) and (self.imaginary == other.imaginary)
    return False

  def __str__(self):
    return f'ComplexNumber({self.real}, {self.imaginary})'

  def __repr__(self):
    return str(self)

  def __add__(self, other):
    if isinstance(other, numbers.Number):
      return ComplexNumber(self.real + other, self.imaginary)
    else:
      return ComplexNumber(self.real + other.real, self.imaginary + other.imaginary)

  def __radd__(self, other):
    return ComplexNumber(self.real + other, self.imaginary)
  
  def __mul__(self, other):
    if isinstance(other, numbers.Number):
      return ComplexNumber(self.real * other, self.imaginary * other)
    else:
      a = self.real
      c = other.real
      b = self.imaginary
      d = other.imaginary
      return ComplexNumber( a*c - b*d, b*c + a*d )

  def __rmul__(self, other):
    return ComplexNumber(self.real * other, self.imaginary * other)
  
  def __sub__(self, other):
    if isinstance(other, numbers.Number):
      return ComplexNumber(self.real - other, self.imaginary)
    else:
      return ComplexNumber(self.real - other.real, self.imaginary - other.imaginary)

  def __rsub__(self, other):
    return ComplexNumber(other - self.real, -self.imaginary)

  def __truediv__(self, other):
    if isinstance(other, numbers.Number):
      return ComplexNumber(self.real / other, self.imaginary / other)
    else:
      a = self.real
      b = self.imaginary
      c = other.real
      d = other.imaginary
      return ComplexNumber((a*c + b*d) / (c*c + d*d), (b*c - a*d) / (c*c + d*d) )

  def __rtruediv__(self, other):
    a = self.real
    b = self.imaginary
    return ComplexNumber( (other * a) / (a*a + b*b), (-b * other) / (a*a + b*b) )

  def __abs__(self):
    return math.sqrt(self.real**2 + self.imaginary**2)

  def conjugate(self):
    return ComplexNumber(self.real, -self.imaginary)

  def exp(self):
   ea = math.exp(self.real)
   b = self.imaginary
   return ComplexNumber(ea * math.cos(b), ea * math.sin(b))

