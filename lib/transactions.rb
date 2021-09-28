require 'date'

class Transaction
  attr_reader :transaction

  def initialize(deposit: deposit = 0.00, withdraw: withdraw = 0.00)
    @transaction = { Date: DateTime.now.strftime('%d-%m-%Y'), Withdrawal: withdraw, Deposit: deposit }
  end

  def create_new_instance(deposit = 0.00, withdraw = 0.00)
    Transaction.new(deposit: deposit, withdraw: withdraw)
  end

end
