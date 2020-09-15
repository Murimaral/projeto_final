class DropPaymentsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :payments 
    drop_table :ask_answers
  end
end
