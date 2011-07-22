require 'spec_helper'

describe WelcomeController do

  it "should redirect to Sign Up page" do
    visit '/'

    page.should have_content('Sign in')
  end

  it "should display product information" do
    visit '/'

    page.should have_table('product', :rows => [['FooBar', '100']])
    page.should have_content('Products')
  end
end
