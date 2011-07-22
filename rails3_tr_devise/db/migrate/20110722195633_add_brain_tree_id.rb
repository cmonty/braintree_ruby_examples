class AddBrainTreeId < ActiveRecord::Migration
  def self.up
    add_column :users, :braintree_customer_id,  :text
  end

  def self.down
    remove_column :users, :braintree_customer_id
  end
end
