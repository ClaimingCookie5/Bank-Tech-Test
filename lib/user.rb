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
end
