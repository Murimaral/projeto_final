class AddColumnToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :delivery_address, :string
    add_column :payments, :price, :decimal
  end
end
