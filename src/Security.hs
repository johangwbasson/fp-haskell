module Security where

import Crypto.KDF.BCrypt (hashPassword, validatePassword)
import qualified Data.ByteString.Char8 as B
import qualified Data.Text as T
import Data.ByteString
import Db
import Token
import User
import Web.JWT
import Data.Text

hash :: String -> IO ByteString
hash pass = hashPassword 12 pass :: IO B.ByteString

lookupUser :: String -> Either String User
lookupUser email =
        case getUserByEmail email of 
            Nothing -> Left "User not found"
            Just u -> Right u

checkPassword :: User -> String -> Either String User
checkPassword user plain =
        if validatePassword packedUserPass packedPass then
            Right user
        else Left "Passwords does not match"
        where 
            packedPass = B.pack plain
            packedUserPass = B.pack user::password

encodeJwt :: String -> Text
encodeJwt id =

    encodeSigned key mempty cs
    where
        cs = mempty { -- mempty returns a default JWTClaimsSet
            iss = stringOrURI id
        }
        secretText = T.pack "secret-key"
        key = hmacSecret secretText


generateToken :: User -> Either String Token
generateToken user = do
    let jwt = encodeJwt user::id
    -- let token =  Token { token = jwt }
    Right Token { token = "" }

         
        

authenticate :: String -> String -> Either String Token
authenticate email password = do
    user <- lookupUser email
    _ <- checkPassword user::password password
    token <- generateToken user
    return Right token