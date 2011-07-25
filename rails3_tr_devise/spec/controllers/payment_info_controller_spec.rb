require 'spec_helper'

describe PaymentInfoController do
  render_views

  it 'should display payment information form' do
    sign_in_as_user

    visit new_payment_info_path

    page.should have_content('Add Payment Info')
    # page.fill_in 'customer_credit_card', :with => '4111111111111111'
    # page.fill_in 'customer_expiration', :with => '01/25'
    # page.fill_in 'customer_cvv', :with => '400'
    # page.click_button 'Save Payment Info'
  end
end
