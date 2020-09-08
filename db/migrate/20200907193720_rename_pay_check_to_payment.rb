class RenamePayCheckToPayment < ActiveRecord::Migration[6.0]
  def change
    rename_table :pay_checks, :payments
    
  end
end
