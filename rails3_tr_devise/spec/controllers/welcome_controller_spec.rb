require 'spec_helper'

describe WelcomeController do

  it "should redirect to Sign Up page" do
    get :index

    page.has_content? 'Sign in'
  end

  it "should display product information" do
    get :index

    page.has_table? 'product', :rows => [['FooBar', '100']]
    page.has_content? 'Products'
  end
end
