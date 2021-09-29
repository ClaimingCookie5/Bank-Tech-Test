# frozen_string_literal: true

require 'account'

describe Account do
  let(:logs) { double('logs', Date: '28-09-2021', Withdraw: 0.00, Deposit: 0.00) }

  it { is_expected.to have_attributes(logs: []) }

  context '.new_transaction' do
    it 'is expecteed to add trasaction to transactions array' do
      allow(logs).to receive(:create) { 20.00 }
      subject.new_transaction(logs, 20.00, 0.00)
      expect(subject.logs).to contain_exactly(20.00)
    end
  end
end
