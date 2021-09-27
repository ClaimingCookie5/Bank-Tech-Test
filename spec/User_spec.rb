require 'User'

describe User do

  it{ is_expected.to be_a(User) }
  it{ is_expected.to have_attributes(balance: 0.00) }

  describe '#deposit' do
    it 'is expected to add number to balance' do
      subject.deposit(20)
      expect(subject.balance).to eq(20.00)
    end

  end

  describe '#withdraw' do
    it 'is expected to subtract number from balance' do
      subject.deposit(20)
      subject.withdraw(5)
      expect(subject.balance).to eq(15.00)
    end

  end

  describe '#statement' do

    before(:each) do
      allow(Time).to receive(:now) { 2021-9-28 }
    end

    it 'is expected to return a statement of activity history' do
      subject.deposit(100)
      expect(subject.statement).to eq("| Date               | Withdrawl          | Deposit            | Balance            |\n| 28/09/2021         |                    | 100.00             | 100.00            |")
    end

  end
  
end
