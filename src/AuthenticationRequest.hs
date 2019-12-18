{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DuplicateRecordFields #-}

module AuthenticationRequest where

import Data.Text.Lazy
import Data.Text.Lazy.Encoding
import Data.Aeson
import Control.Applicative

data AuthenticateRequest = AuthenticateRequest
    { email :: String
    , password :: String  
    } deriving (Show)

instance FromJSON AuthenticateRequest where 
    parseJSON (Object v) = AuthenticateRequest <$>
                                v .: "email" <*>
                                v .: "password" 
                                
instance ToJSON AuthenticateRequest where
    toJSON (AuthenticateRequest email password) =
        object ["email" .= email,
                "password" .= password] 