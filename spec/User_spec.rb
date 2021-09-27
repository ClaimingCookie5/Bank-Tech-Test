require 'User'

describe User do

  it{ is_expected.to be_a(User) }
  it{ is_expected.to have_attributes(balance: 0.00) }

end
