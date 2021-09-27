require 'date'

class User

  attr_reader :balance, :statements

  def initialize
    @balance = 0.00
    @statements = [{Date: ["28-09-2021"], Withdrawl: [0.00], Deposit: [20.00], Balance: [20.00]}]
  end

  def deposit(ammount)
    @balance += ammount
  end

  def withdraw(ammount)
    @balance -= ammount
  end

end
