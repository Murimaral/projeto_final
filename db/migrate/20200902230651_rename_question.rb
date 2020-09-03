class RenameQuestion < ActiveRecord::Migration[6.0]
  def change
    rename_column :questions, :question, :ask
  end
end
