# frozen_string_literal: true

require 'account'

describe Account do
  let(:transaction) { double('transaction', Date: '28-09-2021', Withdraw: 0.00, Deposit: 0.00) }

  it { is_expected.to have_attributes(balance: 0.0, logs: []) }

  context '.new_transaction' do
    it 'is expecteed to add trasaction to transactions array' do
      allow(transaction).to receive(:create) { 20.00 }
      subject.new_transaction(transaction, 20.00, 0.00)
      expect(subject.logs).to contain_exactly(20.00)
    end

    it 'is expected to update balance on transaction' do
      allow(transaction).to receive(:create) { 20.00 }
      expect { subject.new_transaction(transaction, 20.00, 0.00) }.to change { subject.balance }.by(20.00)
    end
  end
end
