FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 3..16) }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
  end


  factory :category do
    title { Faker::Internet.username(specifier: 3..16) }
    description { "this is description" }
    user
  end

  factory :image do
    title { Faker::Internet.username(specifier: 3..16) }
    image { "232" }
    category
    user
  end

  factory :activity_log do
    action_type { "view" }
    user { "categories/show" }
    association :user
  end
  factory :comment do
    action_type { "view" }
    user { "categories/show" }
    association :user
  end
end
