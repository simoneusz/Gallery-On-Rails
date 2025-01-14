require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "vadilation" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:commentable_type) }
    it { should validate_presence_of(:commentable_id) }
    it { should_not validate_length_of(:content).is_at_least(1).is_at_most(141) }
  end
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:commentable) }
  end
end
