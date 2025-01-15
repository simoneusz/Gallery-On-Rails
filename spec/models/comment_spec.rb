require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:commentable_type) }
    it { is_expected.to validate_presence_of(:commentable_id) }
    it { is_expected.to validate_length_of(:content).is_at_least(1).is_at_most(140) }
  end
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:commentable) }
  end
end
