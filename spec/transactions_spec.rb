require 'transactions'

describe Transaction do
  before(:each) do
    allow(DateTime).to receive(:now).and_return DateTime.new(2021, 9, 28)
  end

  it { is_expected.to have_attributes( transaction: { Date: '28-09-2021', Withdraw: 0.00, Deposit: 0.00}) }

  describe '.create_new' do
    it 'is expected to create new instance of Transaction' do
      expect(Transaction.create).to be_an_instance_of(Transaction)
    end
  end
end
