# frozen_string_literal: true

# Outputs transaction information
class Account
  attr_reader :logs

  def initialize
    @logs = []
  end

  def new_transaction(transaction, deposit = 0.00, withdraw = 0.00)
    @logs.push(transaction.create(transaction, deposit, withdraw))
  end
end
