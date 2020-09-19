class AddDefaultToStatus < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.integer :status
      t.string  :delivery_address
      t.integer :pay_met
      t.references :ad, null: false, foreign_key: true
      

      t.timestamps
  end
end
