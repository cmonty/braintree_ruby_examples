RSpec.configure do |config|
    config.include Devise::TestHelpers, :type => :controller
end

def valid_attributes(attrs = {})
  { :username => 'testuser',
    :email => 'test@example.com',
    :password => '123456',
    :password_confirmation => '123456'}.update(attrs)
end

def create_user(attrs = {})
  User.create!(valid_attributes(attrs))
end

def sign_in_as_user(attrs = {})
  user = create_user(attrs)

  visit new_user_session_path

  fill_in 'user_email', :with => 'test@example.com'
  fill_in 'user_password', :with => '123456'
  click_button 'Sign in'
end
