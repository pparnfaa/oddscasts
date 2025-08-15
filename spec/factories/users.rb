FactoryBot.define do
  factory :user do
    email_address { "admin@example.com" }
    password { "password" }
  end
end
