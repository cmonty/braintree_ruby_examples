require 'spec_helper'

describe User do

  it "should construct customer with braintree data" do
    user = create_user(:braintree_customer_id => '663636').with_braintree_data!

    user.first_name.should eql('Big')
    user.last_name.should eql('Spender')
    user.credit_cards.size.should_not be_nil
    user.custom_fields.size.should eql(3)
  end

  it "should have payment info" do
    user = create_user :braintree_customer_id => '663636'

    user.has_payment_info?.should be_true
  end

  it "should find customer's default card" do
    user = create_user(:braintree_customer_id => '663636').with_braintree_data!

    default_credit_card = user.default_credit_card

    default_credit_card.should_not be_nil
    default_credit_card.masked_number.should eql('356600******7510')
    default_credit_card.expiration_date.should eql('04/2012')
  end

  it "should return nil if customer has no braintree data" do
    user = create_user.with_braintree_data!

    default_credit_card = user.default_credit_card

    default_credit_card.should be_nil
  end

end
