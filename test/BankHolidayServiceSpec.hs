module BankHolidayServiceSpec (spec) where

import BankHolidayService

import Test.Hspec

spec :: Spec
spec =
  describe "main" $ do
    it "returns the unit" $
      main `shouldReturn` ()
