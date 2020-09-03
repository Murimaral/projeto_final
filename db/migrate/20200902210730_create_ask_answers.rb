class CreateAskAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :ask_answers do |t|
      t.string :question
      t.references :ad, null: false, foreign_key: true
      t.string :answer

      t.timestamps
    end
  end
end
