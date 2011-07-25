class PaymentInfoController < ApplicationController
  before_filter :authenticate_user!

  def new
    @tr_data = _generate_tr_data
  end
end
