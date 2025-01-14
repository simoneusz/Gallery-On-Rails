require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:category_id) }
  end
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:category) }
  end
end
