require 'rails_helper'

RSpec.describe PlaylistSong, type: :model do
  describe "プレイリストソングの作成" do
    context "正常に作成されること" do
      it "必要な項目を全て入力" do
        playlist_song = build(:playlist_song)
        expect(playlist_song).to be_valid
        expect(playlist_song.errors).to be_empty
      end
    end

    context "バリデーションエラーが表示されること" do
      it "キーが選択されていない" do
        playlist_song_without_key = build(:playlist_song, key: nil)
        expect(playlist_song_without_key).to be_invalid
        expect(playlist_song_without_key.errors[:key]).to eq ["を入力してください", "は数値で入力してください"]
      end

      it "キーを-7で設定" do
        playlist_song_with_minus7key = build(:playlist_song, key: -7)
        expect(playlist_song_with_minus7key).to be_invalid
        expect(playlist_song_with_minus7key.errors[:key]).to eq ["は-6以上の値にしてください"]
      end

      it "キーを+7で設定" do
        playlist_song_with_plus7key = build(:playlist_song, key: 7)
        expect(playlist_song_with_plus7key).to be_invalid
        expect(playlist_song_with_plus7key.errors[:key]).to eq ["は6以下の値にしてください"]
      end

      it "楽曲が存在しない" do
        playlist_song_without_song = build(:playlist_song, song: nil)
        expect(playlist_song_without_song).to be_invalid
        expect(playlist_song_without_song.errors[:song]).to eq ["を入力してください"]
      end

      it "プレイリストが存在しない" do
        playlist_song_without_playlist = build(:playlist_song, playlist: nil)
        expect(playlist_song_without_playlist).to be_invalid
        expect(playlist_song_without_playlist.errors[:playlist]).to eq ["を入力してください"]
      end
    end
  end
end
