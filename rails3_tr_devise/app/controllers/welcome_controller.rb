class WelcomeController < ApplicationController

  def index
    redirect_to new_user_session_url unless user_signed_in?
    current_user.with_braintree_data!
    @products = Product.all
  end
end
