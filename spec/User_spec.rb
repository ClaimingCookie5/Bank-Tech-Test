require 'User'

describe User do

  it{ is_expected.to have_attributes(balance: 0) }

end
