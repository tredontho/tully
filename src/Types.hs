module Types where

import Data.Time

type Money = Float

type Date = UTCTime

toUTCTime :: Day -> UTCTime
toUTCTime d = UTCTime d 0
