FactoryBot.define do
  factory :playlist_song do
    key { 0 }
    association :playlist
    association :song
  end
end
