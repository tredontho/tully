### Alright, how the hell do I want this to work?

* I want to have multiple accounts.
* An account should have a balance and a name, I want to easily see how much money is in that account
* I want to be able to add a transaction which moves money between accounts
  * What about transactions which may not be an account I own?
    * Still worth giving it a name? 
    * Should it be marked as some sort of special type?  `ExternalAccount`?
  * The transaction can be in the past, today, in the future
    * A transaction that is in the past is _not_ necessarily applied already (e.g. rent is effectively moved on the 1st, but may not clear until the 3rd)
    * Some sort of status should track the transactions... status.  Whether it's applied or pending
  * Need to figure out how transactions actually effect balance updates

### Use Cases or something

#### Payday Deposit

* Create two accounts, savings and checking
* Initialize with balances, effective some date (current date by default?)
* Make deposit into checking account (e.g. paycheck)
  * Good use case for a transaction which does not have a source account

#### ATM Withdrawal
* Create two accounts, savings and checking
* Initialize with balances, effective some date (current date by default?)
* Make withdrawal from checking account (e.g. ATM)
  * Good use case for a transaction which does not have a target account

#### Immediate Transfer between Accounts
* Create two accounts, savings and checking
* Initialize with balances, effective some date (current date by default?)
* Schedule a transfer from checking to savings, effective immediately

#### Future Transfer between Accounts
* Create two accounts, savings and checking
* Initialize with balances, effective some date (current date by default?)
* Schedule a transfer from checking to savings, some date in the future

#### Backdated Transfer between Accounts
* Create two accounts, savings and checking
* Initialize with balances, effective some date (current date by default?)
* Schedule a transfer from checking to savings, some date in the past

#### Manual Correction of Account Balance
* Create two accounts, savings and checking
* Initialize with balances, effective some date (current date by default?)
* Modify the balance of an account without a transfer

