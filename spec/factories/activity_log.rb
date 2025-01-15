FactoryBot.define do
  factory :activity_log do
    action_type { 'view' }
    user { 'categories/show' }
    association :user
  end
end
