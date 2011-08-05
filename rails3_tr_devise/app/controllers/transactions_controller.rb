class TransactionsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @product = Product.find(params[:product_id])

    if current_user.has_payment_info?
      current_user.with_braintree_data!
    else
      redirect_to new_payment_info_path
    end
  end

end
