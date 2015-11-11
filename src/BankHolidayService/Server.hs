{-# LANGUAGE OverloadedStrings #-}
module BankHolidayService.Server (runServer) where

import Control.Monad.Trans.Either
import Data.Text
import Network.Wai
import Network.Wai.Handler.Warp
import Servant

import BankHolidayService.API as API
import BankHolidayService.Types

import Data.Time.Calendar.BankHoliday.UnitedStates (bankHolidays)

data Handler a = EitherT ServantErr IO a

server :: Server BankHolidayAPI
server = listHolidays

listHolidays :: Int -> Handler [Day]
listHolidays year = return $ bankHolidays year

app :: Application
app = serve API.bankholidayAPI server

runServer :: Port -> IO ()
runServer port = run port app
