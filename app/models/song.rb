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

  def self.search(query)
    ITunesSearchAPI.search(term: query, media: "music", country: 'jp', limit: 2)
  end
end
