{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}

module Account where

import Data.Text (Text)
import Types

data Transaction = Tx
  { otherAccount :: AccountLabel,
    amount :: Money,
    date :: Date
  }
  deriving (Show)

newtype AccountLabel = AcctLabel
  {label :: Text}
  deriving (Show)

-- | An account is a label, a current balance, and a list of transactions
data Account = Account
  { -- | A human readable "name" for an account
    label :: Text,
    -- | The latest/current balance of an account
    balance :: Money,
    -- | A list of all transactions which are on an account
    transactions :: [Transaction]
  }
  deriving (Show)

toLabel :: Account -> AccountLabel
toLabel Account {label} = AcctLabel label

newAccount :: Text -> Account
newAccount label = Account {label = label, balance = 0.0, transactions = []}
