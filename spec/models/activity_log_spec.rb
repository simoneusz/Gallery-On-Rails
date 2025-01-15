require 'rails_helper'

RSpec.describe ActivityLog, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:action_type) }
    it { should validate_presence_of(:url) }
  end
  describe 'associations' do
    it { should belong_to(:user) }
  end
end
