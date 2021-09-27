require 'User'

describe User do

  it{ is_expected.to have_attributes(balance: 0) }
  it{ is_expected.to be_a(User) }


end
