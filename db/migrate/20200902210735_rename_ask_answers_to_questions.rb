class RenameAskAnswersToQuestions < ActiveRecord::Migration[6.0]
  def change
     rename_table :ask_answers, :questions
    end
end
