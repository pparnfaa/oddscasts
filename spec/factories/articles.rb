FactoryBot.define do
  factory :article do
    title { "Sprint on Rails" }
    description { "This is a test article for Sprint on Rails." }
    status { "draft" }
  end
end
