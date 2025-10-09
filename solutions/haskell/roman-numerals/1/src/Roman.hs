module Roman (numerals) where

numerals :: Integer -> Maybe String
numerals n
    | n < 1 || n > 3999 = Nothing
    | n == 0    = Just ""
    | n >= 1000 = (Just "M")  <> numerals (n - 1000)
    | n >= 900  = (Just "CM") <> numerals (n - 900)
    | n >= 500  = (Just "D")  <> numerals (n - 500)
    | n >= 400  = (Just "CD") <> numerals (n - 400)
    | n >= 100  = (Just "C")  <> numerals (n - 100)
    | n >= 90   = (Just "XC") <> numerals (n - 90)
    | n >= 50   = (Just "L")  <> numerals (n - 50)
    | n >= 40   = (Just "XL") <> numerals (n - 40)
    | n >= 10   = (Just "X")  <> numerals (n - 10)
    | n >= 9    = (Just "IX") <> numerals (n - 9)
    | n >= 5    = (Just "V")  <> numerals (n - 5)
    | n >= 4    = (Just "IV") <> numerals (n - 4)
    | n >= 1    = (Just "I")  <> numerals (n - 1)
