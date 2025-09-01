module SecretHandshake (handshake) where

handshake :: Int -> [String]
handshake n = if (doReverse digits) then (reverse actions) else actions
  where
    digits = reverse (base2 n)
    handle1 [] = []
    handle1 (n : _) = if n == 1 then ["wink"] else []
    handle2 (_ : n : _) = if n == 1 then ["double blink"] else []
    handle2 _ =  []
    handle3 (_ : _ : n : _) = if n == 1 then ["close your eyes"] else []
    handle3 _ =  []
    handle4 (_ : _ : _ : n : _) = if n == 1 then ["jump"] else []
    handle4 _ =  []
    actions = (handle1 digits) ++ (handle2 digits) ++ (handle3 digits) ++ (handle4 digits)
    doReverse (_ : _ : _ : _ : n : _) = if n == 1 then True else False
    doReverse _ = False

base2 :: Integral a => a -> [a]
base2 m = reverse $ loop m
  where
    loop :: Integral a => a -> [a]
    loop n
     | n == 0    = []
     | 2 > n     = [n]
     | otherwise = (n `mod` 2) : loop (n `div` 2)
