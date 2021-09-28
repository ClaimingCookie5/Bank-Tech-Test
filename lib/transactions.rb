class Transaction
  attr_reader :transaction

  def initialize(deposit = 0.00, withdrawal = 0.00)
    @transaction = { Date: DateTime.now.strftime('%d-%m-%Y'), Withdrawal: withdrawal, Deposit: deposit }
  end

end
