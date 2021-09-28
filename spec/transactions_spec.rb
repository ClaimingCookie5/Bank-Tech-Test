require 'transactions'

describe Transaction do

  it { is_expected.to have_attributes( transaction: { Date: [], Withdrawals: [], Deposits: [], Balance: [] }) }

end
