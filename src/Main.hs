{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty
import Network.HTTP.Types

import Domain

main = scotty 7125 $ do
  post "/authenticate" $ do
    authReq <- jsonData :: ActionM AuthenticateRequest
    json authReq
  notFound $ do
    text "Not found"
