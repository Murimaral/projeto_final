class AddPayoptToDeal < ActiveRecord::Migration[6.0]
  def change
    remove_column :deals, :delivery_address, :string
    add_column :deals, :deliver_diff_ad, :integer, default: 0

  end
end
