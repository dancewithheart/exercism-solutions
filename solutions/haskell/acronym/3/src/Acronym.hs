module Acronym (abbreviate) where

import Data.Char (isUpper)
import Data.Text (Text)
import qualified Data.Text as T

abbreviate :: Text -> Text
abbreviate str = T.concat (map initials (tokenize str))
  where
    initials :: Text -> Text
    initials s
      | upChars == T.empty                 = T.toUpper (T.singleton (T.head s))
      | (T.length upChars) == (T.length s) = T.singleton (T.head s)
      | otherwise                          = upChars
      where
        upChars = T.filter isUpper s
    tokenize :: Text -> [Text]
    tokenize s = T.words $ T.map hyphen2space s
    hyphen2space c = if c == '-' then ' ' else c
