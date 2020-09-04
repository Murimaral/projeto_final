class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.references :ad, null: false, foreign_key: true
      t.references :colaborator, null: false, foreign_key: true
      t.integer :status, default: 0
      t.decimal :final_price
      t.integer :pay_met, default: 0
      t.string :delivery_address

      t.timestamps
    end
  end
end
