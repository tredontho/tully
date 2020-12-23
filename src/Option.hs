module Option
  ( OptionType (..),
    OptionStatus (..),
    Option,
    mkOption,
  )
where

import Data.Text (Text)
import Data.Time (Day)

data OptionType = Call | Put
  deriving (Show, Eq)

data OptionStatus = Open | Closed | Assigned | Expired
  deriving (Show, Eq)

type Expiration = Day

type StockSymbol = Text

type Strike = Float
type Price = Float

data Option = Option
  { symbol :: StockSymbol,
    expiration :: Expiration,
    optionType :: OptionType,
    strike :: Strike,
    price :: Price,
    status :: OptionStatus
  }
  deriving (Show)

mkOption :: StockSymbol -> Expiration -> OptionType -> Strike -> Price -> OptionStatus -> Option
mkOption = Option
