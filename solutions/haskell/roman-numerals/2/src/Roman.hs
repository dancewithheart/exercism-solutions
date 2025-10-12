module Roman (numerals) where

numerals :: Integer -> Maybe String
numerals n
  | n < 1 || n > 3999 = Nothing
  | otherwise = Just $ romanNum n
  where
    romanNum :: Integer -> String
    romanNum n
      | n == 0    = ""
      | n >= 1000 = "M"  <> romanNum (n - 1000)
      | n >= 900  = "CM" <> romanNum (n - 900)
      | n >= 500  = "D"  <> romanNum (n - 500)
      | n >= 400  = "CD" <> romanNum (n - 400)
      | n >= 100  = "C"  <> romanNum (n - 100)
      | n >= 90   = "XC" <> romanNum (n - 90)
      | n >= 50   = "L"  <> romanNum (n - 50)
      | n >= 40   = "XL" <> romanNum (n - 40)
      | n >= 10   = "X"  <> romanNum (n - 10)
      | n >= 9    = "IX" <> romanNum (n - 9)
      | n >= 5    = "V"  <> romanNum (n - 5)
      | n >= 4    = "IV" <> romanNum (n - 4)
      | n >= 1    = "I"  <> romanNum (n - 1)
