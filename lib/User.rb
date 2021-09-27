require 'date'

class User

  attr_reader :balance, :transactions

  def initialize
    @balance = 0.00
    @transactions = { date: [], withdrawals: [], deposits: [], balance: 0.00 }
  end

  def deposit(ammount)
    @balance += ammount
    log_transaction(@transactions[:deposits], @transactions[:withdrawals], ammount)
  end

  def withdraw(ammount)
    @balance -= ammount
    log_transaction(@transactions[:withdrawals], @transactions[:deposits], ammount)
  end

  private

  def log_transaction(action, reverse_action, ammount)
    @transactions[:date].push(DateTime.now.strftime('%d-%m-%Y'))
    action.push(ammount.to_f)
    reverse_action.push(0.00)
    @transactions[:balance] = @balance
  end

end
