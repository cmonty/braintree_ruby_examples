require 'spec_helper'
include Warden::Test::Helpers

describe WelcomeController do
  render_views

  it "should redirect to Sign In page" do
    visit root_path

    page.should have_content('Sign in')
  end

  it "should display product information" do
    Product.create(:name => 'FooBar', :price => 100)
    sign_in_as_user

    visit root_path

    page.should have_table('products')
    page.should have_content('Products')

  end
end
