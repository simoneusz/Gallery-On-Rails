FactoryBot.define do
  factory :comment do
    action_type { 'view' }
    user { 'categories/show' }
    association :user
    association :commentable, factory: :category
  end
end
