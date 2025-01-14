require 'rails_helper'

# spec/models/category_spec.rb

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  subject { build(:category, user: user) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_least(1).is_at_most(24) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:images).order(likes_count: :desc).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:subscriptions).dependent(:destroy) }
    it { should have_many(:subscribers).through(:subscriptions).source(:user) }
  end

  describe 'methods' do
    let(:category) { create(:category, user: user) }
    let(:other_category) { create(:category, user: user) }

    before do
      create(:image, likes_count: 5, category: category)
      create(:image, likes_count: 3, category: category)
    end

    describe '#total_likes_count' do
      it 'returns the total likes count for all images in the category' do
        expect(category.total_likes_count).to eq(8)
      end
    end

    describe '#next' do
      # it 'returns the next category based on ID' do
      #   expect(category.next).to eq(other_category)
      # end

      it 'returns the first category if no next category exists' do
        other_category.destroy
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
