require 'rails_helper'

RSpec.describe Score, type: :model do
  describe "スコアの新規登録" do
    context "正常に作成されること" do
      it "必要な項目を全て入力" do
        score = build(:score)
        expect(score).to be_valid
        expect(score.errors).to be_empty
      end
    end

    context "バリデーションエラーが表示されること" do
      it "スコアが未入力" do
        without_score = build(:score, score: "")
        expect(without_score).to be_invalid
        expect(without_score.errors[:score]).to eq ["を入力してください", "を60 ~ 100までの値で入力してください"]
      end

      it "スコアが60未満" do
        score_with_under_60 = build(:score, score: 59)
        expect(score_with_under_60).to be_invalid
        expect(score_with_under_60.errors[:score]).to eq ["を60 ~ 100までの値で入力してください"]
      end

      it "スコアが101以上" do
        score_with_over_100 = build(:score, score: 101)
        expect(score_with_over_100).to be_invalid
        expect(score_with_over_100.errors[:score]).to eq ["を60 ~ 100までの値で入力してください"]
      end

      it "キーが選択されていない" do
        score_without_key = build(:score, key: nil)
        expect(score_without_key).to be_invalid
        expect(score_without_key.errors[:key]).to eq ["を入力してください", "は数値で入力してください"]
      end

      it "キーを-7で設定" do
        score_with_minus7key = build(:score, key: -7)
        expect(score_with_minus7key).to be_invalid
        expect(score_with_minus7key.errors[:key]).to eq ["は-6以上の値にしてください"]
      end

      it "キーを+7で設定" do
        score_with_plus7key = build(:score, key: 7)
        expect(score_with_plus7key).to be_invalid
        expect(score_with_plus7key.errors[:key]).to eq ["は6以下の値にしてください"]
      end

      it "楽曲が存在しない" do
        score_without_song = build(:score, song: nil)
        expect(score_without_song).to be_invalid
        expect(score_without_song.errors[:song]).to eq ["を入力してください"]
      end

      it "ユーザーが存在しない" do
        score_without_user = build(:score, user: nil)
        expect(score_without_user).to be_invalid
        expect(score_without_user.errors[:user]).to eq ["を入力してください"]
      end
    end
  end
end
