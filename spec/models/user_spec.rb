require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should_not validate_length_of(:username).is_at_least(3).is_at_most(17) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('test@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
  end

  describe 'associations' do
    it { should have_many(:categories).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:subscriptions).dependent(:destroy) }
    it { should have_many(:subscribed_categories).through(:subscriptions) }
    it { should have_many(:notifications).dependent(:destroy) }
    it { should have_many(:activity_logs).dependent(:destroy) }
  end

  describe '#download_avatar_from_url' do
    let(:user) { build(:user) }

    it 'sets the remote avatar URL' do
      url = 'http://example.com/avatar.jpg'
      user.download_avatar_from_url(url)
      expect(user.remote_avatar_url).to eq(url)
    end
  end
end
