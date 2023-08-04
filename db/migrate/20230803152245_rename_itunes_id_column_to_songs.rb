class RenameItunesIdColumnToSongs < ActiveRecord::Migration[7.0]
  def change
    rename_column :songs, :itunes_id, :preview_url
  end
end
