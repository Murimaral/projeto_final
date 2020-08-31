class CreateColaborators < ActiveRecord::Migration[6.0]
  def change
    create_table :colaborators do |t|
      t.string :name
      t.string :social_name
      t.string :address
      t.string :role
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status
      t.string :section

      t.timestamps
    end
  end
end
