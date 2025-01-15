require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  subject { build(:category, user:) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(1).is_at_most(24) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:images).order(likes_count: :desc).dependent(:destroy) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_many(:subscriptions).dependent(:destroy) }
    it { is_expected.to have_many(:subscribers).through(:subscriptions).source(:user) }
  end

  describe 'methods' do
    let(:category) { create(:category, user: user) }
    let(:other_category) { create(:category, user: user) }

    before do
      create(:image, likes_count: 5, category: category)
      create(:image, likes_count: 3, category: category)
    end

    describe '#total_likes_count' do
      subject { category.total_likes_count }

      it 'returns the total likes count for all images in the category' do
        is_expected.to eq(8)
      end
    end

    describe '#next' do
      before { other_category.destroy }

      it 'returns the first category if no next category exists' do
        expect(category.next).to eq(Category.first)
      end
    end

    describe '#previous' do
      it 'returns the previous category based on ID' do
        expect(other_category.previous).to eq(category)
      end

      it 'returns the first category if no previous category exists' do
        category.destroy
        expect(other_category.previous).to eq(Category.first)
      end
    end
  end
end
