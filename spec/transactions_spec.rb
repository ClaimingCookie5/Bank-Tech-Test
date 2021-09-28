require 'transactions'

describe Transaction do
  before(:each) do
    allow(DateTime).to receive(:now).and_return DateTime.new(2021, 9, 28)
  end

  it { is_expected.to have_attributes( transaction: { Date: '28-09-2021', Withdrawal: 0.00, Deposit: 0.00}) }

end
