# == Schema Information
#
# Table name: users
#
#  id                                  :bigint           not null, primary key
#  access_count_to_reset_password_page :integer          default(0)
#  crypted_password                    :string
#  email                               :string           not null
#  email_token                         :string
#  email_token_expires_at              :datetime
#  name                                :string           not null
#  remember_me_token                   :string
#  remember_me_token_expires_at        :datetime
#  reset_password_email_sent_at        :datetime
#  reset_password_token                :string
#  reset_password_token_expires_at     :datetime
#  salt                                :string
#  unconfirmed_email                   :string
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_remember_me_token     (remember_me_token)
#  index_users_on_reset_password_token  (reset_password_token)
#
class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  has_many :playlists, dependent: :destroy
  has_many :scores, dependent: :destroy

  validates :password, presence: true, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true
  validates :email_token, uniqueness: true, allow_nil: true

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  def is_score?(song)
    self.scores.where(song: song).exists?
  end

  def max_score(song)
    self.scores.where(song: song).maximum(:score)
  end

  def email_change
    self.email = unconfirmed_email
    self.unconfirmed_email = nil
    self.email_token = nil
    self.email_token_expires_at = nil
    save
  end
end
