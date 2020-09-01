class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.string :name
      t.string :category
      t.string :description
      t.decimal :cost
      t.references :colaborator, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
