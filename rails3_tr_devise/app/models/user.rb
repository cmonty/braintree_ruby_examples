module BraintreeUser

  FIELDS = [:first_name, :last_name, :phone, :website, :company, :email, :fax, :addresses, :credit_cards, :custom_fields]

  def self.attach_braintree_data(user)
    braintree_data = Braintree::Customer.find(user.braintree_customer_id)

    FIELDS.each do |field|
      user.class.send(:define_method, field) { braintree_data.send(field) }
    end
  end

end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :braintree_customer_id

  include BraintreeUser

  def has_payment_info?
    !!self.braintree_customer_id
  end

  def with_braintree_data!
    return self unless self.has_payment_info?

    BraintreeUser.attach_braintree_data(self)
    self
  end

  def default_credit_card
    return nil unless self.has_payment_info?

    self.credit_cards.find { |cc| cc.default? }
  end
end
