require 'date'

class User

  attr_reader :transactions

  def initialize
    @transactions = { Date: [], Withdrawals: [], Deposits: [], Balance: [] }
  end

  def deposit(ammount)
    raise 'Please input a number' if !ammount.to_i.instance_of?(Integer) || !ammount.to_f.instance_of?(Float)
    raise 'Please enter a positive number' if ammount < 0

    log_transaction(select(:Deposits), select(:Withdrawals), ammount)
  end

  def withdraw(ammount)
    raise 'Insufficient funds. Make a deposit or try again' if calc_balance - ammount < 0

    log_transaction(select(:Withdrawals), select(:Deposits), ammount)
  end

  def calc_balance
    select(:Deposits).compact.sum - select(:Withdrawals).compact.sum
  end

  def generate_statement
    index = 0
    statement = [statement_head]
    while index < select(:Date).length
      logs = statement_body(index).map { |log| log.ljust(16) }.join << "|\n"
      statement.push(logs)
      index += 1
    end
    statement.flatten.join
  end

  private

  def log_transaction(action, reverse_action, ammount)
    select(:Date).push(DateTime.now.strftime('%d-%m-%Y'))
    select(:Balance).push(calc_balance)
    action.push(ammount.to_f)
    reverse_action.push(nil)
  end

  def select(action)
    @transactions[action]
  end

  def to_two_dec(item)
    item.nil? ? "" : '%.2f' % item
  end

  def statement_head
    [      
      "\n| Date          | Withdrawals   | Deposits      | Balance       |\n",
      "|---------------|---------------|---------------|---------------|\n"
    ]
  end

  def statement_body(index)
    [
      "| #{select(:Date)[index]} ", "| #{to_two_dec(select(:Withdrawals)[index])} ",
       "| #{to_two_dec(select(:Deposits)[index])} ", "| #{to_two_dec(select(:Balance)[index])} "
    ]
  end
  
end
