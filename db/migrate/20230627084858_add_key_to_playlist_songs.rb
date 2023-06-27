class AddKeyToPlaylistSongs < ActiveRecord::Migration[7.0]
  def change
    add_column :playlist_songs, :key, :integer, default: 0, null: false
  end
end
