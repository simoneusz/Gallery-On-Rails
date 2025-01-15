require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:record_type) }
    it { is_expected.to validate_presence_of(:record_id) }
  end
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:record) }
  end
end
