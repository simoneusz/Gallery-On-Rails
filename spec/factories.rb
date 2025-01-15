require 'rails_helper'

FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(specifier: 3..16) }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
  end

  factory :category do
    title { Faker::Internet.username(specifier: 3..16) }
    description { 'this is description' }
    user
  end

  factory :image do
    title { 'Test Image' }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test_image.jpg'), 'image/jpg') }

    association :category
    association :user
  end

  factory :activity_log do
    action_type { 'view' }
    user { 'categories/show' }
    association :user
  end

  factory :comment do
    action_type { 'view' }
    user { 'categories/show' }
    association :user
    association :commentable, factory: :category
  end

  factory :subscription do
    user
    category
  end
end
