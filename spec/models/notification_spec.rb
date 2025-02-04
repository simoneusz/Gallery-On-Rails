require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:message) }
    it { is_expected.to validate_presence_of(:user_id) }
  end
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
