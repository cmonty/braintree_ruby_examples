require 'spec_helper'

describe WelcomeController do

  it "should redirect to Sign In page" do
    visit '/'

    page.should have_content('Sign in')
  end

  it "should display product information" do
    sign_in create_user

    visit '/'

    page.should have_table('products', :rows => [['FooBar', '100']])
    page.should have_content('Products')
  end
end
