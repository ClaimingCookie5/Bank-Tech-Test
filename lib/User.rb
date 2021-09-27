require 'date'

class User

  attr_reader :balance, :transactions

  def initialize
    @transactions = { Date: [], Withdrawals: [], Deposits: [], Balance: [] }
  end

  def deposit(ammount)
    log_transaction(select(:Deposits), select(:Withdrawals), ammount)
  end

  def withdraw(ammount)
    log_transaction(select(:Withdrawals), select(:Deposits), ammount)
  end

  def calc_balance
    (select(:Deposits).sum - select(:Withdrawals).sum).to_f
  end

  private

  def log_transaction(action, reverse_action, ammount)
    select(:Date).push(DateTime.now.strftime('%d-%m-%Y'))
    action.push(ammount.to_f)
    reverse_action.push(0.00)
    select(:Balance).push(calc_balance)
  end

  def select(action)
    @transactions[action]
  end

end
