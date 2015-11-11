{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module BankHolidayService.API () where

import Data.Proxy
import Servant.API
import Shifts.Types

bankholidayAPI :: Proxy BankHolidayAPI
bankholidayAPI = Proxy

type BankHolidayAPI =
       ListHoliday

type ListHoliday = "holidays"
  :> Capture "year" Int
  :> Get '[JSON] [Day]
