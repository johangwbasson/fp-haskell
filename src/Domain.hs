{-# LANGUAGE OverloadedStrings #-}
module Domain where
import Data.Text.Lazy
import Data.Text.Lazy.Encoding
import Data.Aeson
import Control.Applicative

data AuthenticateRequest = AuthenticateRequest
    { email :: Text 
    , password :: Text  
    } deriving (Show)

instance FromJSON AuthenticateRequest where 
    parseJSON (Object v) = AuthenticateRequest <$>
                                v .: "email" <*>
                                v .: "password" 
                                
instance ToJSON AuthenticateRequest where
    toJSON (AuthenticateRequest email password) =
        object ["email" .= email,
                "password" .= password]                             

data Token = Token  {
    token :: Text
} deriving (Show)

instance ToJSON Token where
        toJSON (Token token) = 
            object ["token" .= token]