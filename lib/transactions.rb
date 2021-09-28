# frozen_string_literal: true

require 'date'

# Handles creation of transaction. Relates to the User class.
class Transaction
  attr_reader :transaction

  def initialize(deposit: deposit = 0.00, withdraw: withdraw = 0.00)
    @transaction = { Date: DateTime.now.strftime('%d-%m-%Y'), Withdraw: withdraw, Deposit: deposit }
  end

  def self.create(deposit = 0.00, withdraw = 0.00)
    Transaction.new(deposit: deposit, withdraw: withdraw)
  end
end
