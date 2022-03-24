FactoryBot.define do
  factory :account do
    name { "TestUser" }
    password { "testpassword" }
    sequence(:username) { |n| "user#{n}" }
    sequence(:email) {|n| "user#{n}@example.com"}
  end
end
