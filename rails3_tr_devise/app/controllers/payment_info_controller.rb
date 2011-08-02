class PaymentInfoController < ApplicationController
  before_filter :authenticate_user!

  def new
    @tr_data = Braintree::TransparentRedirect.
                create_customer_data(:redirect_url => confirm_payment_info_url)
  end

  def edit
    @customer = current_user.with_braintree_data!
    @tr_data = Braintree::TransparentRedirect.
                update_customer_data(:redirect_url => confirm_payment_info_url,
                                     :customer_id => @customer.braintree_customer_id)
  end

  def confirm
    @result = Braintree::TransparentRedirect.confirm(request.query_string)

    if @result.success?
      current_user.braintree_customer_id = @result.customer.id
      current_user.save!
      render :action => "confirm"
    elsif current_user.has_payment_info?
      @customer = current_user.with_braintree_data!
      render :action => "edit"
    else
      render :action => "new"
    end
  end
end
