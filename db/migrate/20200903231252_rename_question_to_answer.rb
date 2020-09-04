class RenameQuestionToAnswer < ActiveRecord::Migration[6.0]
  def change
    rename_column :negociations, :question, :answer
  end
end
