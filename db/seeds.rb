default_user = User.find_by(username: 'default')
cars_category = Category.find_by(slug: 'cars')

comments_content = ['hey, nice category!', 'Love that!', 'I will share this', ' Check mine!']

comments_content.each do |comment|
  cars_category.comments.create(content: comment, user: default_user)
end
