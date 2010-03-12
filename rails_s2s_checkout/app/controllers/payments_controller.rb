class PaymentsController < ApplicationController
  # ensure credit card numbers and cvv are not written to the log
  filter_parameter_logging :number, :cvv

  def new
    @amount = calculate_amount
  end

  def create
    params[:transaction].merge!(:amount => calculate_amount)
    @result = Braintree::Transaction.sale(params[:transaction])

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

