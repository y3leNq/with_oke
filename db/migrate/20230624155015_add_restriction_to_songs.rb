class AddRestrictionToSongs < ActiveRecord::Migration[7.0]
  def change
    change_column_null :songs, :title, false
    change_column_null :songs, :artist, false
    change_column_default :songs, :itunes_id, nil
  end
end
