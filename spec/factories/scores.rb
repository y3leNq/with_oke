FactoryBot.define do
  factory :score do
    score { 100 }
    key { 0 }
    association :user
    association :song
  end
end
