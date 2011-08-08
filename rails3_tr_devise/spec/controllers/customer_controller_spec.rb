require 'spec_helper'

describe CustomerController do
  render_views

  it 'should display payment information form' do
    sign_in_as_user

    visit new_customer_path

    page.should have_content('Add Payment Info')
  end

  it 'should display sign in page for unauthorized user (new)' do

    visit new_customer_path

    page.should have_content('Sign in')
    page.should have_field('user_email')
    page.should have_field('user_password')
  end

  it 'should make new payment info' do
    sign_in_as_user

    visit new_customer_path

    page.fill_in 'customer_credit_card_number', :with => '4111111111111111'
    page.fill_in 'customer_credit_card_expiration_date', :with => '01/25'
    page.fill_in 'customer_credit_card_cvv', :with => '400'
    page.click_button 'Save Payment Info'

    page.should have_content('Payment Info Confirmation')
    page.should have_content('411111******1111')
  end

  it 'should display form again because of validation errors' do
    sign_in_as_user

    visit new_customer_path

    page.should have_content('Add Payment Info')
    page.fill_in 'customer_credit_card_expiration_date', :with => '01/05'
    page.fill_in 'customer_credit_card_cvv', :with => '400'
    page.click_button 'Save Payment Info'

    page.should have_content('Add Payment Info')
    page.should have_field('customer_credit_card_expiration_date', :with => '01/05')
    page.should have_field('customer_credit_card_cvv')
    page.should have_css('#total-errors')
  end

  it 'should display form to edit existing customer data' do
    sign_in_as_user :braintree_customer_id => '663636'

    visit edit_customer_path(:id => '1')

    page.should have_content('Edit Payment Info')
    page.should have_field('customer_first_name', :with => 'Big')
    page.should have_field('customer_last_name', :with => 'Spender')
    page.should have_content('356600******7510')

    page.fill_in 'customer_first_name', :with => 'Big'
    page.fill_in 'customer_last_name', :with => 'Spender'
    page.click_button 'Save Payment Info'

    page.should have_content('Payment Info Confirmation')
    page.should have_content('Big')
  end


  it 'should display sign in page for unauthorized user (edit)' do

    visit edit_customer_path(:id => '1')

    page.should have_content('Sign in')
    page.should have_field('user_email')
    page.should have_field('user_password')
  end
end
