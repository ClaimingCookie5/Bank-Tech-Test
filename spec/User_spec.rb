require 'User'

describe User do

  it{ is_expected.to be_a(User) }
  it{ is_expected.to have_attributes(balance: 0.00)}

  describe '#deposit' do
    before(:each) do
      allow(DateTime).to receive(:now) { "28-09-2021" }
    end

    it 'is expected to add number to balance' do
      subject.deposit(20)
      expect(subject.balance).to eq(20.00)
    end

    it 'is expected to add the activity history to statements' do
      subject.deposit(20)
      expect(subject.statements).to include({Date: ["28-09-2021"], Withdrawl: [0.00], Deposit: [20.00], Balance: [20.00]})
    end

  end

  describe '#withdraw' do
    it 'is expected to subtract number from balance' do
      subject.deposit(20)
      subject.withdraw(5)
      expect(subject.balance).to eq(15.00)
    end

  end
  
end
