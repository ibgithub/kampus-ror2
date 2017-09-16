class AddPaymentStatusToSubscription < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :payment_status, :string
  end
end
