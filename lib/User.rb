class User

  attr_reader :balance

  def initialize
    @balance = 0.00
  end

  def deposit(ammount)
    @balance += ammount
  end

  def withdraw(ammount)
    @balance -= ammount
  end

end
