module Types
  ( Money,
    Transaction,
    Account,
    newAccount,
    mkTransaction,
  )
where

import Data.Text (Text)
import Data.Time

type Money = Float

type Date = UTCTime

data TransactionStatus
  = -- | A transaction which is scheduled but has not yet executed
    Scheduled
  | -- | A transaction which has completed
    Completed
  | -- | A transaction which was originally scheduled, but later canceled
    Canceled
  deriving (Show)

-- | A transaction is a pair of accounts, a date, an amount, and transaction
-- status
data Transaction = Tx
  { -- | The account *from* which money is taken
    source :: Account,
    -- | The account which *receives* the money
    target :: Account,
    -- | When the transaction is scheduled to take place
    date :: Date,
    -- | How much money is being moved between accounts
    amount :: Money,
    -- | The current status of the transaction
    status :: TransactionStatus
  }
  deriving (Show)

-- | Creates a transaction between two accounts.  The first argument is the
--  source.  If the amount is negative, then the arguments are flipped.
mkTransaction ::
  -- | The source account
  Account ->
  -- | The target account
  Account ->
  -- | The amount being transferred. Note: If this is negative, the source and target are flipped
  Money ->
  -- | When the transaction occurs
  Date ->
  Transaction
mkTransaction src target amount date
  | signum amount < 0 = mkTransaction target src (negate amount) date
  | otherwise = newTx {source = applyTo src, target = applyTo target}
  where
    applyTo acct = acct {transactions = newTx : transactions acct}
    newTx = Tx {source = src, target = target, amount = amount, status = Scheduled, date = date}


-- | An account is a label, a current balance, and a list of transactions
data Account = Account
  { label :: Text, -- ^A human readable "name" for an account
    balance :: Money, -- ^The latest/current balance of an account
    transactions :: [Transaction] -- ^A list of all transactions which are on an account
  }
  deriving (Show)

newAccount :: Text -> Account
newAccount label = Account {label = label, balance = 0.0, transactions = []}
