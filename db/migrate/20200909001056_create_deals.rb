class CreateDeals < ActiveRecord::Migration[6.0]
  def change
    create_table :deals do |t|
      t.references :colaborator, null: false, foreign_key: true
      t.references :ad, null: false, foreign_key: true
      t.decimal :discount, default:0
      t.decimal :freight, default:0
      t.string :address

      t.timestamps
    end
  end
end
