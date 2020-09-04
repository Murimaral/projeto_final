class CreateNegociations < ActiveRecord::Migration[6.0]
  def change
    create_table :negociations do |t|
      t.references :ad, null: false, foreign_key: true
      t.references :colaborator, null: false, foreign_key: true
      t.string :ask
      t.string :question
      t.decimal :current_price

      t.timestamps
    end
  end
end
