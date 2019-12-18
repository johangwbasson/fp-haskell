{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DuplicateRecordFields #-}

module Token where

import Data.Text.Lazy
import Data.Text.Lazy.Encoding
import Data.Aeson
import Control.Applicative    

data Token = Token  {
    token :: String
} deriving (Show)

instance ToJSON Token where
        toJSON (Token token) = 
                object ["token" .= token]    