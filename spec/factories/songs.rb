FactoryBot.define do
  factory :song do
    artist { "withoke" }
    sequence(:title) { |n| "withoke_#{n}" }
  end
end
