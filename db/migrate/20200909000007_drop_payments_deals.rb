class DropPaymentsDeals < ActiveRecord::Migration[6.0]
  def change
    drop_table :deals 
    drop_table :payments 
  end
end
