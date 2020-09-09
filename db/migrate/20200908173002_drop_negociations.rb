class DropNegociations < ActiveRecord::Migration[6.0]
  def change
    drop_table :negociations
  end
end
