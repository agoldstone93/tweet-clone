FactoryBot.define do
  factory :account do
    name { "TestUser" }
    email { "testuser@example.com" }
    password { "testpassword" }

    sequence(:username) { |n| "user#{n}" }
  end
end
