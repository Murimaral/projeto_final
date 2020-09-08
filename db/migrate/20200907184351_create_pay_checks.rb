class CreatePayChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :pay_checks do |t|
      t.references :colaborator, null: false, foreign_key: true
      t.references :ad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
