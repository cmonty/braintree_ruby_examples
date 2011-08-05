require 'spec_helper'

describe TransactionsController do
  render_views

  it "should purchase product" do
    Product.create(:name => 'FooBar', :price => 100)

    sign_in_as_user :braintree_customer_id => '663636'

    visit new_transaction_path(:product_id => '1')

    page.should have_content('Confirm Purchase')
    page.should have_content('Big')
    page.should have_content('Spender')
    page.should have_content('356600******7510')
    page.should have_content('04/2012')
    page.should have_button('Confirm Purchase')

    page.click_button 'Confirm Purchase'

    page.should have_content('Receipt')
  end

  it "should display new payment information form" do
    sign_in_as_user

    visit new_transaction_path(:product_id => '1')

    page.should have_content('Add Payment Info')
  end

end
