FactoryBot.define do
  factory :user do
    name { "Taro Yamada" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "password" }
  end
end
