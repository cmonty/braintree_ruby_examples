class WelcomeController < ApplicationController

  def index
    redirect_to new_user_session_url unless user_signed_in?
    current_user.with_braintree_data! if current_user.has_payment_info?
    @products = Product.all
  end
end
