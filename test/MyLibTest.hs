{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import qualified Account as A
import Data.Time
import Data.Time.Format.ISO8601
import qualified Transaction as T
import Types
import Data.Maybe

main :: IO ()
main = putStrLn "Test suite not yet implemented."

checking = A.newAccount "checking"

savings = A.newAccount "savings"

simpleTime :: String -> UTCTime
simpleTime = toUTCTime . fromJust . iso8601ParseM
