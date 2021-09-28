# frozen_string_literal: true

require 'user'

describe User do

  let(:transaction) { double('transaction', :Date => '28-09-2021', :Withdraw => 0.00, :Deposit => 0.00) }

  before(:each) do
    allow(DateTime).to receive(:now).and_return DateTime.new(2021, 9, 28)
  end

  it { is_expected.to be_a(User) }

  context '#deposit' do
    it 'is expected to deposit ammount' do
      allow(transaction).to receive(:create) { 20.00 }
      expect(subject.deposit(transaction, 20.00)).to eq(20.00)
    end
  end

  context '#withdraw' do
    it 'is expected to subtract number from balance' do
      subject.deposit(20)
      subject.withdraw(5)
      expect(subject.calc_balance).to eq(15.00)
    end

  #   it 'is expected to add the transaction history to transactions on withdrawal' do
  #     subject.deposit(20)
  #     subject.withdraw(20)
  #     expect(subject.transactions).to eq(
  #       Date: %w[28-09-2021 28-09-2021], Withdrawals: [nil, 20.00], Deposits: [20.00, nil], Balance: [0.00, 20.00]
  #     )
  #   end
  end

  # context '#generate_statement' do
  #   it 'is expected to generate a statement of transaction history' do
  #     subject.deposit(200)
  #     expect { subject.generate_statement }.to output {'| Date              | Withdrawals       | Deposits          | Balance           |
  #                                                       |-------------------|-------------------|-------------------|-------------------|
  #                                                       | 28-09-2021        |                   | 200.00            | 0.00              |'
  #     }.to_stdout
  #   end

  #   it 'is expected to generate a more extensive statement ' do
  #     subject.deposit(2500)
  #     subject.deposit(500)
  #     allow(DateTime).to receive(:now).and_return DateTime.new(2021, 9, 29)
  #     subject.withdraw(2000)
  #     subject.withdraw(1000)
  #     expect { subject.generate_statement }.to output {'| Date              | Withdrawals       | Deposits          | Balance           |
  #                                                       |-------------------|-------------------|-------------------|-------------------|
  #                                                       | 28-09-2021        |                   | 2500.00           | 0.00              |
  #                                                       | 28-09-2021        |                   | 500.00            | 2500.00           |
  #                                                       | 29-09-2021        | 2000.00           |                   | 3000.00           |
  #                                                       | 29-09-2021        | 1000.00           |                   | 1000.00           |'
  #     }.to_stdout
  #   end
  # end
end
