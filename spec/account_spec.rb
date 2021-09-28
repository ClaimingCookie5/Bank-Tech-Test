require 'account'

describe Account do

  it { is_expected.to have_attributes(transactions: []) }

end
