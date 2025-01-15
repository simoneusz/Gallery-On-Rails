FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 3..16) }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
