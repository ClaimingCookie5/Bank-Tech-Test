class Transaction
  attr_reader :transaction

  def initialize
    @transaction = { Date: [], Withdrawals: [], Deposits: [], Balance: [] }
  end

end
