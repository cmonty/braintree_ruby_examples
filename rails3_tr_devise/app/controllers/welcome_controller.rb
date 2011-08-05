class WelcomeController < ApplicationController

  def index
    redirect_to new_user_session_path unless user_signed_in?

    if current_user && current_user.has_payment_info?
      current_user.with_braintree_data!
    end

    @products = Product.all
  end
end
