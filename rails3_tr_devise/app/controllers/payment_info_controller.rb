class PaymentInfoController < ApplicationController
  before_filter :authenticate_user!

  def new
    @tr_data = Braintree::TransparentRedirect.create_customer_data(:redirect_url => confirm_payment_info_url)
  end

  def confirm
   @result = Braintree::TransparentRedirect.confirm(request.query_string)

   if @result.success?
    current_user.braintree_customer_id = @result.customer.id
    current_user.save!
    render :action => "confirm"
   else
    render :action => "new"
   end

  end
end
