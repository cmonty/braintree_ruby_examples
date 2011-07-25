class WelcomeController < ApplicationController

  def index
    redirect_to new_user_session_url unless user_signed_in?
    @product = Product.all.first
  end
end
