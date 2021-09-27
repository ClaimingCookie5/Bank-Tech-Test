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
    (select(:Deposits).compact.sum - select(:Withdrawals).compact.sum).to_f
  end

  def generate_statement
    index = 0
    statement = [      
      "\n| Date          | Withdrawals   | Deposits      | Balance       |\n",
      "|---------------|---------------|---------------|---------------|\n"
    ]

    while index < select(:Date).length
      log = [
        "| #{select(:Date)[index]} ", "| #{select(:Withdrawals)[index]} ",
         "| #{select(:Deposits)[index]} ", "| #{select(:Balance)[index]} "
        ]
      logs = log.map { |log| log.ljust(16) }.join
      statement.push(logs << "|\n")
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

end
