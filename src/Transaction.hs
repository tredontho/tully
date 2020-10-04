module Transaction where

import Account (Account, toLabel)
import qualified Account as A
import Types

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
  | otherwise = newTx {source = addTx src (toLabel target), target = addTx target (toLabel src)}
  where
    addTx curr otherLabel = curr {A.transactions = A.Tx {A.otherAccount = otherLabel, A.amount = amount, A.date = date} : A.transactions curr}
    -- applyTo acct = acct {transactions = newTx : transactions acct}
    newTx = Tx {source = src, target = target, amount = amount, status = Scheduled, date = date}
