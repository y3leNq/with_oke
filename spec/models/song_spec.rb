require 'rails_helper'

RSpec.describe Song, type: :model do
  describe "楽曲の新規登録" do
    context "正常に作成されること" do
      it "必要な項目を全て入力" do
        song = build(:song)
        expect(song).to be_valid
        expect(song.errors).to be_empty
      end
    end

    context "バリデーションエラーが表示されること" do
      it "アーティスト名が未入力" do
        song_without_artist = build(:song, artist: "")
        expect(song_without_artist).to be_invalid
        expect(song_without_artist.errors[:artist]).to eq ["を入力してください"]
      end

      it "曲名が未入力" do
        song_without_title = build(:song, title: "")
        expect(song_without_title).to be_invalid
        expect(song_without_title.errors[:title]).to eq ["を入力してください"]
      end

      it "存在する楽曲を入力" do
        exist_song = build(:song, title: create(:song).title)
        expect(exist_song).to be_invalid
        expect(exist_song.errors[:artist]).to eq ["はすでに存在します"]
      end
    end
  end
end
