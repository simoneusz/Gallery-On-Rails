# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

default_user = User.find_by(username: 'default')
cars_category = Category.find_by(slug: 'cars')

comments_content = ['hey, nice category!', 'Love that!', 'I will share this', ' Check mine!']

comments_content.each do |comment|
  cars_category.comments.create(content: comment, user: default_user)
end
