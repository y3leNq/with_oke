# == Schema Information
#
# Table name: songs
#
#  id          :bigint           not null, primary key
#  artist      :string           not null
#  preview_url :string
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Song < ApplicationRecord
  require_relative '../../lib/itunes_search_api'

  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, through: :playlist_songs
  has_many :scores, dependent: :destroy

  validates :artist, :title, presence: true
  validates :artist, uniqueness: { scope: :title }

  def self.search(query)
    ITunesSearchAPI.search(term: query, media: 'music', country: 'jp')
  end

  def self.lookup(query)
    ITunesSearchAPI.lookup(id: query, country: 'jp')
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[artist created_at id itunes_id title updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[playlist_songs playlists scores]
  end

  def self.top_songs
    top_songs = PlaylistSong.group(:song_id).order('count_song_id DESC').limit(10).count(:song_id)
    top_songs.keys.map { |key| Song.find(key) }
  end

  def set_key(playlist)
    self.playlist_songs.where(playlist_id: playlist).first.key
  end
end
