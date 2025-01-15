require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:category_id) }
  end
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:category) }
  end
end
