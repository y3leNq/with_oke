# == Schema Information
#
# Table name: songs
#
#  id         :bigint           not null, primary key
#  artist     :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  itunes_id  :string
#
class Song < ApplicationRecord
end
