{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module BankHolidayService.API (BankHolidayAPI, bankHolidayAPI) where

import BankHolidayService.Types
import Data.Proxy
import Data.Time (Day)
import Servant.API

bankHolidayAPI :: Proxy BankHolidayAPI
bankHolidayAPI = Proxy

type BankHolidayAPI =
       ListHoliday

type ListHoliday = "holidays"
  :> Capture "year" Int
  :> Get '[JSON] [Day]
