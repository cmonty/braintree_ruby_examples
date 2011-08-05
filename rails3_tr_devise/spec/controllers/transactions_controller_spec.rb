require 'spec_helper'

describe TransactionsController do
  render_views

  it "should display page to purchase product" do
    sign_in_as_user :braintree_customer_id => '663636'

    visit root_path
    p page.body

    page.click_link('Buy FooBar')

    page.should have_content('Confirm Purchase')
    page.should have_button('#buy')

    page.click_button('#buy')

    page.should have_content('Receipt')
  end

end
