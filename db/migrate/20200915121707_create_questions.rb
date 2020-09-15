class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :ad, null: false, foreign_key: true
      t.string :ask
      t.string :answer

      t.timestamps
    end
  end
end
