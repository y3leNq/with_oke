require 'rails_helper'

RSpec.describe Playlist, type: :model do
  describe "プレイリストの新規登録" do
    context "正常に作成されること" do
      it "必要な項目をすべて入力" do
        playlist = build(:playlist)
        expect(playlist).to be_valid
        expect(playlist.errors).to be_empty
      end
    end

    context "バリデーションエラーが表示されること" do
      it "プレイリストネームが未入力" do
        playlist_without_name = build(:playlist, name: "")
        expect(playlist_without_name).to be_invalid
        expect(playlist_without_name.errors[:name]).to eq ["を入力してください"]
      end

      it "ユーザーが存在しない" do
        playlist_without_user = build(:playlist, user: nil)
        expect(playlist_without_user).to be_invalid
        expect(playlist_without_user.errors[:user]).to eq ["を入力してください"]
      end
    end
  end
end
