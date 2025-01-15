FactoryBot.define do
  factory :category do
    title { Faker::Internet.username(specifier: 3..16) }
    description { 'this is description' }
    user
  end
end
