require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:record_type) }
    it { should validate_presence_of(:record_id) }
  end
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:record) }
  end
end
