# frozen_string_literal: true

require_relative 'transactions'

# Class that tracks users transactions.
# Allows them to make deposits, withdrawals,
# check their current balance and make a bank stament.
class User
  def initialize
    @account = Account.new
  end

  def deposit(transaction, ammount)
    @account.new_transaction(transaction, ammount)
  end

  def withdraw(transaction, ammount)
    @account.new_transaction(transaction, 0.00, ammount)
  end
end
