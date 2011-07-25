class WelcomeController < ApplicationController

  def index
    redirect_to new_user_session_url unless user_signed_in?
    @products = Product.all
  end
end
