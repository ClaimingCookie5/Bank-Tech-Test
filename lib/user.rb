# frozen_string_literal: true

# Class that tracks users transactions.
# Allows them to make deposits, withdrawals,
# check their current balance and make a bank stament.
class User
  attr_reader :transactions

  def initialize
    @transactions = { Date: [], Withdrawals: [], Deposits: [], Balance: [] }
  end

  def deposit(ammount)
    base_errs(ammount)

    log_transaction(select(:Deposits), select(:Withdrawals), ammount)
  end

  def withdraw(ammount)
    withdrawal_errors(ammount)

    log_transaction(select(:Withdrawals), select(:Deposits), ammount)
  end

  def calc_balance
    select(:Deposits).compact.sum - select(:Withdrawals).compact.sum
  end

  def generate_statement
    index = 0
    statement = [statement_head]
    while index < select(:Date).length
      statement.push(statement_body(index).map { |log| log.ljust(20) }.join << "|\n")
      index += 1
    end
    print statement.join
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

  def to_two_deci(item)
    item.nil? ? '' : '%.2f' % item
  end

  def statement_head
    [
      "\n| Date              | Withdrawals       | Deposits          | Balance           |\n",
      "|-------------------|-------------------|-------------------|-------------------|\n"
    ]
  end

  def statement_body(index)
    [
      "| #{select(:Date)[index]} ", "| #{to_two_deci(select(:Withdrawals)[index])} ",
      "| #{to_two_deci(select(:Deposits)[index])} ", "| #{to_two_deci(select(:Balance)[index])} "
    ]
  end

  def withdrawal_errors(input)
    base_errs(input)
    raise 'Insufficient funds. Make a deposit or try again' if (calc_balance - input).negative?
  end

  def base_errs(input)
    raise 'Please enter a positive number' if input.negative?
    raise 'Please input a number' if !input.to_i.instance_of?(Integer) || !input.to_f.instance_of?(Float)
  end
end
