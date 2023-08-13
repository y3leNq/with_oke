FactoryBot.define do
  factory :playlist do
    name { "withoke" }
    association :user
  end
end
