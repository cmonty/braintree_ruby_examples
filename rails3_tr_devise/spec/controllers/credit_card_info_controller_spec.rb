require 'spec_helper'

describe CreditCardInfoController do
  render_views

  it "should display form to edit credit card" do
    sign_in_as_user :braintree_customer_id => '663636'

    visit edit_credit_card_info_path(:id => 'mzg2')

    page.should have_field('credit_card_number', :with => '411111******1111')
    page.should have_field('credit_card_expiration_date', :with => '09/2010')

    page.click_button 'Save Payment Info'

    page.should have_content('Payment Info Confirmation')
    page.should have_content('411111******1111')
  end

  it "should display form to edit credit card from editing user info" do
    sign_in_as_user :braintree_customer_id => '663636'

    visit edit_payment_info_path(:id => '1')

    page.should have_link('mzg2')
    page.click_link('mzg2')

    page.should have_field('credit_card_number', :with => '411111******1111')
    page.should have_field('credit_card_expiration_date', :with => '09/2010')
  end

  it "should display sign in form for unauthorized user" do

    visit edit_credit_card_info_path(:id => 'mzg2')

    page.should have_content('Sign in')
    page.should have_field('user_email')
    page.should have_field('user_password')
  end

  it "should display form again because of validation errors" do
    sign_in_as_user :braintree_customer_id => '663636'

    visit edit_credit_card_info_path(:id => 'mzg2')

    page.should have_field('credit_card_number', :with => '411111******1111')
    page.should have_field('credit_card_expiration_date', :with => '09/2010')

    page.fill_in 'credit_card_number', :with => 'abcdefghijklmn'

    page.click_button 'Save Payment Info'

    page.should have_content('Edit Credit Card')
    page.should have_css('#total-errors')
    page.should have_content('Credit card number is invalid')
  end
end
