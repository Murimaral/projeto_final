class AddDefaultToStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :deals, :status, :integer, default:0
    change_column :deals, :pay_met, :integer, default:0
  end
end
