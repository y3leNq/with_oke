FactoryBot.define do
  factory :user do
    name { "withoke" }
    sequence(:email) { |n| "withoke_#{n}@example.com" }
    password { "withoke" }
    password_confirmation { "withoke" }
  end
end
