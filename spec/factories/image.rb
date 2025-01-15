FactoryBot.define do
  factory :image do
    title { 'Test Image' }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test_image.jpg'), 'image/jpg') }

    association :category
    association :user
  end
end
