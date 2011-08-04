require 'spec_helper'

describe User do

  it "should construct customer with braintree data" do
    user = create_user.with_braintree_data!

    user.first_name.should eql('Big')
    user.last_name.should eql('Spender')
    user.credit_cards.size.should_not be_nil
    user.custom_fields.size.should eql(3)
  end

  it "should have payment info" do
    user = create_user

    user.has_payment_info?.should be_true
  end

end
