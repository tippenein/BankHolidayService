{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}

module BankHolidayService.Types
  ( BankHoliday(..)
  ) where

import Data.Aeson
import Data.Text
import GHC.Generics

data BankHoliday = BankHoliday { _day :: Day }
    deriving (Show, Eq, ToJSON, FromJSON, Generic)

parseDate :: String -> Day
parseDate = parseTimeOrError True defaultTimeLocale "%Y-%m-%d"

instance FromJSON Day where
  parseJSON (Object v) = liftM parseDate (v .: "date")

instance ToJSON Day where
  toJSON = toJSON . showGregorian

