# == Schema Information
#
# Table name: scores
#
#  id         :bigint           not null, primary key
#  key        :integer          default(0), not null
#  score      :decimal(5, 3)    not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  song_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_scores_on_song_id  (song_id)
#  index_scores_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (song_id => songs.id)
#  fk_rails_...  (user_id => users.id)
#
class Score < ApplicationRecord
  belongs_to :user
  belongs_to :song

  validates :score, presence: true, numericality: { greater_than_or_equal_to: 60, less_than_or_equal_to: 100, message: 'を60 ~ 100までの値で入力してください' }
  validates :key, presence: true, numericality: { greater_than_or_equal_to: -6, less_than_or_equal_to: 6 }
end
