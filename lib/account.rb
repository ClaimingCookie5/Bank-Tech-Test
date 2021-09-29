# frozen_string_literal: true

# Holds and Outputs transaction information
class Account
  attr_reader :logs, :balance

  def initialize
    @balance = 0.0
    @logs = []
  end

  def new_transaction(transaction, deposit = 0.00, withdraw = 0.00)
    @balance = 20.00
    @logs.push(transaction.create(transaction, deposit, withdraw))
  end
end
