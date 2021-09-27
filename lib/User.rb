require 'date'

class User

  attr_reader :balance, :transactions

  def initialize
    @transactions = { date: [], withdrawals: [], deposits: [], balance: [] }
  end

  def deposit(ammount)
    log_transaction(@transactions[:deposits], @transactions[:withdrawals], ammount)
  end

  def withdraw(ammount)
    log_transaction(@transactions[:withdrawals], @transactions[:deposits], ammount)
  end

  def calc_balance
    (@transactions[:deposits].sum - @transactions[:withdrawals].sum).to_f
  end

  private

  def log_transaction(action, reverse_action, ammount)
    @transactions[:date].push(DateTime.now.strftime('%d-%m-%Y'))
    action.push(ammount.to_f)
    reverse_action.push(0.00)
    @transactions[:balance].push(calc_balance)
  end

end
