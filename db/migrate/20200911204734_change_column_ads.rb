class ChangeColumnAds < ActiveRecord::Migration[6.0]
  def change
    change_column :ads, :category, :integer
  end
end
