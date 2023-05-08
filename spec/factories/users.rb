FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "test#{n}"}
    sequence(:email) {|n| "test#{n}@example.com"}
    password { "password" }
    password_digest { User.digest("password") }
    remember_digest { User.digest("remember") }
  end
end
