class ChangeNegociationColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :negociations, :current_price, :decimal
  end
end
