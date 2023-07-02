# == Schema Information
#
# Table name: songs
#
#  id         :bigint           not null, primary key
#  artist     :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  itunes_id  :string
#
class Song < ApplicationRecord
  require_relative '../../lib/itunes_search_api'

  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, through: :playlist_songs

  validates :artist, :title, presence: true
  validate :exist_song

  def self.search(query)
    ITunesSearchAPI.search(term: query, media: "music", country: 'jp', limit: 2)
  end

  def self.lookup(query)
    ITunesSearchAPI.lookup(id: query, country: 'jp')
  end

  def exist_song
    if Song.exists?(title: title, artist: artist)
      errors.add(:base, 'この楽曲は存在しています')
      false
    else
      true
    end
  end
end
