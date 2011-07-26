class PaymentInfoController < ApplicationController
  before_filter :authenticate_user!

  def new
    @tr_data = Braintree::TransparentRedirect.create_customer_data(:redirect_url => confirm_payment_info_url)
  end
end
