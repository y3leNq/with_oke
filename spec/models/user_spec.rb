require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザーの新規登録" do
    context "正常に作成されること" do
      it "必要な項目を全て入力" do
        user = build(:user)
        expect(user).to be_valid
        expect(user.errors).to be_empty
      end
    end

    context "バリデーションエラーが表示されること" do
      it "ユーザーネームが未入力" do
        user_without_name = build(:user, name: "")
        expect(user_without_name).to be_invalid
        expect(user_without_name.errors[:name]).to eq ["を入力してください"]
      end

      it "メールアドレスが未入力" do
        user_without_email = build(:user, email: "")
        expect(user_without_email).to be_invalid
        expect(user_without_email.errors[:email]).to eq ["を入力してください"]
      end

      it "存在しているメールアドレスを入力" do
        user_with_exist_email = build(:user, email: create(:user).email)
        expect(user_with_exist_email).to be_invalid
        expect(user_with_exist_email.errors[:email]).to eq ["はすでに存在します"]
      end

      it "パスワードが未入力" do
        user_without_password = build(:user, password: "")
        expect(user_without_password).to be_invalid
        expect(user_without_password.errors[:password]).to eq ["を入力してください", "は3文字以上で入力してください"]
      end

      it "パスワード(確認)が未入力" do
        user_without_password_confirmation = build(:user, password_confirmation: "")
        expect(user_without_password_confirmation).to be_invalid
        expect(user_without_password_confirmation.errors[:password_confirmation]).to eq ["とパスワードの入力が一致しません", "を入力してください"]
      end

      it "パスワードとパスワード(確認)が不一致" do
        user_password_with_rspec = build(:user, password: "rspec")
        expect(user_password_with_rspec).to be_invalid
        expect(user_password_with_rspec.errors[:password_confirmation]).to eq ["とパスワードの入力が一致しません"]
      end

      it "パスワードを3文字未満で入力" do
        user_password_with_rs = build(:user, password: "rs", password_confirmation: "rs")
        expect(user_password_with_rs).to be_invalid
        expect(user_password_with_rs.errors[:password]).to eq ["は3文字以上で入力してください"]
      end
    end
  end
end
