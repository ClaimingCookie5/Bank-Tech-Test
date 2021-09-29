# frozen_string_literal: true

# Outputs transaction information
class Account
  attr_reader :logs

  def initialize
    @logs = []
  end

  def new_transaction(transaction, deposit, withdraw)
    @logs.push(transaction.create(transaction, deposit, withdraw))
  end
end
