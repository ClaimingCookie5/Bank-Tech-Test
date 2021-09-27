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
  
end
