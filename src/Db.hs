module Db where

import Prelude hiding (id) 
import User

getUserByEmail :: String -> Maybe User
getUserByEmail email = 
    if (email == "admin") then
        Just User { 
                id = "adbb1d21-0ff1-4e1d-abab-8abe56486165",
                email = "admin",
                password = "bcrypt+sha512$8036a3377379e581bbfee0e77a035806$12$8b0668d95bffa7752ce1f8f7ba5e212fa4b77b41f611ab26"
            }
    else 
        Nothing