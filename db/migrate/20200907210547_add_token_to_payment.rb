class AddTokenToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :token, :string, unique:true
  end
end
