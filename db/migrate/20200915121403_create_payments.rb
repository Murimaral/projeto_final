class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.decimal :receipt
      t.references :colaborator, null: false, foreign_key: true
      t.references :deal, null: false, foreign_key: true

 
      t.timestamps
    end
  end
end
