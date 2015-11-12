{-# LANGUAGE OverloadedStrings #-}
module BankHolidayService.Server (runServer) where

import Control.Monad.Trans.Either
import Data.Text
import Data.Time
import Network.Wai
import Network.Wai.Handler.Warp
import Servant

import BankHolidayService.API as API
import BankHolidayService.Types

import Data.Time.Calendar.BankHoliday.UnitedStates as BH

type Handler a = EitherT ServantErr IO a

server :: Server BankHolidayAPI
server = listHolidays

listHolidays :: Integer -> Handler [Day]
listHolidays year = return $ BH.bankHolidays year

app :: Application
app = serve API.bankHolidayAPI server

runServer :: Port -> IO ()
runServer port = run port app
