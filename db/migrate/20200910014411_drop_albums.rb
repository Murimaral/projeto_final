class DropAlbums < ActiveRecord::Migration[6.0]
  def change
    drop_table :albums
  end
end
