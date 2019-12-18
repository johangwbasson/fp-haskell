{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Network.HTTP.Types

import AuthenticationRequest
import Security

main = scotty 7125 $ do
  post "/authenticate" $ do
    authReq <- jsonData :: ActionM AuthenticateRequest
    case authenticate authReq.email authReq.password of
      Right token -> json token
      Left msg -> json msg

  notFound $ text "Not found"
