require 'spec_helper'

describe PaymentInfoController do
  render_views

  it 'should display payment information form' do
    sign_in_as_user

    visit new_payment_info_path

    page.should have_content('Add Payment Info')
    page.fill_in 'customer_credit_card_number', :with => '4111111111111111'
    page.fill_in 'customer_credit_card_expiration_date', :with => '01/25'
    page.fill_in 'customer_credit_card_cvv', :with => '400'
    page.click_button 'Save Payment Info'

    page.should have_content('Payment Info Confirmation')
    page.should have_content('411111******1111')
  end

  it 'should display form again because of validation errors' do
    sign_in_as_user

    visit new_payment_info_path
  end
end
