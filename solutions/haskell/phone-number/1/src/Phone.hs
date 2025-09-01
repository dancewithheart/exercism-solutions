module Phone (number) where

import Data.Char (isDigit)

orElse :: Maybe a -> Maybe a -> Maybe a
x `orElse` y = case x of
                 Just _  -> x
                 Nothing -> y

data PhoneNumber = PhoneNumber {
  areaCode :: String,
  exchangeCode :: String,
  subscriberNumber :: String
}

showPhoneNumber :: PhoneNumber -> String
showPhoneNumber phoneNumber =
  (areaCode phoneNumber) ++
  (exchangeCode phoneNumber) ++
  (subscriberNumber phoneNumber)

number :: String -> Maybe String
number xs = fmap showPhoneNumber ((numberWithInternationalCode xs) `orElse` (numberNoInternationalCode xs))

validatePhoneNumber :: PhoneNumber -> Maybe PhoneNumber
validatePhoneNumber phoneNumber
  | not (validAreaCode phoneNumber)         = Nothing
  | not (validExchangeCode phoneNumber)     = Nothing
  | not (validSubscriberNumber phoneNumber) = Nothing
  | otherwise = Just phoneNumber
  where
    from2to9 :: Char -> Bool
    from2to9 c = (c >= '2') && (c <= '9')
    validAreaCode phoneNumber =
      (length $ areaCode phoneNumber) == 3 &&
      (all isDigit $ areaCode phoneNumber) &&
      (from2to9 (head $ areaCode phoneNumber))
    validExchangeCode phoneNumber =
      (length $ exchangeCode phoneNumber) == 3 &&
      (from2to9 (head $ exchangeCode phoneNumber)) &&
      (all isDigit $ exchangeCode phoneNumber)
    validSubscriberNumber phoneNumber =
      (length $ subscriberNumber phoneNumber) == 4 &&
      (all isDigit $ subscriberNumber phoneNumber)


numberWithInternationalCode :: String -> Maybe PhoneNumber
numberWithInternationalCode = validatePhoneNumber . parsePhoneNumber . dropInternationalCode
  where
    dropInternationalCode :: String -> String
    dropInternationalCode xs =
        if (head fromFirstDigit == '1')
        then dropUntilDigit (tail fromFirstDigit)
        else fromFirstDigit
      where
        fromFirstDigit = (dropUntilDigit xs)

numberNoInternationalCode :: String -> Maybe PhoneNumber
numberNoInternationalCode = validatePhoneNumber . parsePhoneNumber . dropUntilDigit

parsePhoneNumber :: String -> PhoneNumber
parsePhoneNumber xs = PhoneNumber areaCode exchangeCode subscriberNumber
  where
    (areaCode, localNumber)  = splitAt 3 xs
    (exchangeCode, subscriberNumberRaw) = splitAt 3 (dropUntilDigit localNumber)
    subscriberNumber = takeWhile isDigit $ dropUntilDigit subscriberNumberRaw

nonDigit :: Char -> Bool
nonDigit = not . isDigit

dropUntilDigit :: String -> String
dropUntilDigit = dropWhile nonDigit
