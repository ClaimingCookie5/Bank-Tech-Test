# frozen_string_literal: true

require 'user'

describe User do
  let(:transaction) { double('transaction', Date: '28-09-2021', Withdraw: 0.00, Deposit: 0.00) }

  before(:each) do
    allow(DateTime).to receive(:now).and_return DateTime.new(2021, 9, 28)
  end

  it { is_expected.to be_a(User) }

  context '#deposit' do
    it 'is expected to deposit ammount' do
      allow(transaction).to receive(:create) { 20.00 }
      expect(subject.deposit(transaction, 20.00)).to eq([20.00])
    end
  end

  context '#withdraw' do
    it 'is expected to subtract number from balance' do
      allow(transaction).to receive(:create) { 20.00 }
      expect(subject.withdraw(transaction, 20.00)).to eq([20.00])
    end
  end
end
