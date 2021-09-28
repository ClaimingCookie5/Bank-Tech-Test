# frozen_string_literal: true
require_relative 'transactions'

# Class that tracks users transactions.
# Allows them to make deposits, withdrawals,
# check their current balance and make a bank stament.
class User

  def deposit(transaction, ammount)
    transaction.create(ammount)
  end

  def withdraw(transaction, ammount)
    transaction.create(0.00, ammount)
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
end
