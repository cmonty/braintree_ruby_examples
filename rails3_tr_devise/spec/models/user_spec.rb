require 'spec_helper'

describe User do

  it "should construct customer with braintree data" do
    user = create_user(:braintree_customer_id => 'jklkj').with_braintree_data

    user.first_name.should eql('Mario')
  end

end
