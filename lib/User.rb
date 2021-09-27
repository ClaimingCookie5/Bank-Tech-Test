require 'date'

class User

  attr_reader :balance, :transactions

  def initialize
    @balance = 0.00
    @transactions = { date: [], withdrawals: [], deposits: [], balance: [] }
  end

  def deposit(ammount)
    @balance += ammount
    @transactions[:date].push(DateTime.now.strftime('%d-%m-%Y'))
    @transactions[:withdrawals].push(0.00)
    @transactions[:deposits].push(ammount.to_f)
    @transactions[:balance] = @balance
  end

  def withdraw(ammount)
    @balance -= ammount
    @transactions[:date].push(DateTime.now.strftime('%d-%m-%Y'))
    @transactions[:withdrawals].push(ammount.to_f)
    @transactions[:deposits].push(0.00)
    @transactions[:balance] = @balance
  end

end
