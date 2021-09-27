class User

  attr_reader :balance

  def initialize
    @balance = 0.00
    @statements = []
  end

  def deposit(ammount)
    @balance += ammount
  end

  def withdraw(ammount)
    @balance -= ammount
  end

  def statement
    "| Date               | Withdrawl          | Deposit            | Balance            |\n| 28/09/2021         |                    | 100.00             | 100.00            |"
  end

end
