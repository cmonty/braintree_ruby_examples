class PaymentsController < ApplicationController
  def new
    @amount = calculate_amount
  end

  def confirm
    @result = Braintree::Transaction.create_from_transparent_redirect(request.query_string)
    if @result.success?
      # success indicates that the input parameters were valid and a transaction was successfully created
      # however, the transaction may be declined or rejected
      render :action => "confirm"
    else
      @amount = calculate_amount
      render :action => "new"
    end
  end

  protected

  def calculate_amount
    # in a real app this be calculated from a shopping cart, determined by the product, etc.
    "100.00"
  end
end

