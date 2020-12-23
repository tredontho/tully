module Option
  ( OptionType (..),
    OptionTxType (..),
    OptionStatus (..),
    Option,
    mkOption,
  )
where

import Data.Text (Text)
import Data.Time (Day)

data OptionType = Call | Put
  deriving (Show, Eq)

data OptionTxType = BuyToOpen | BuyToClose | SellToOpen | SellToClose
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
    openDate :: Day,
    closeDate :: Maybe Day,
    optionType :: OptionType,
    strike :: Strike,
    openPrice :: Price,
    closePrice :: Maybe Price,
    status :: OptionStatus
  }
  deriving (Show)

mkOption :: StockSymbol -> Expiration -> Day -> OptionType -> Strike -> Price -> Option
mkOption ss exp openDt ot strike openPrice = Option ss exp openDt Nothing ot strike openPrice Nothing Open
