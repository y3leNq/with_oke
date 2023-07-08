require 'faker'

user = User.create!(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: 'withoke',
  password_confirmation: 'withoke'
)

playlist = user.playlists.create!(
  name: Faker::Music.genre
)

30.times do
  song = Song.create!(
    title: Faker::Music::Phish.song,
    artist: Faker::Music::Phish.album
  )

  PlaylistSong.create!(
    playlist_id: playlist.id,
    song_id: song.id,
    key: Faker::Number.between(from: -6, to: 6)
  )
end
