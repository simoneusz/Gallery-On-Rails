require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:image) { create(:image) }
  let(:valid_comment_params) { { content: 'This is a test comment', commentable_type: 'Category' } }
  let(:invalid_comment_params) { { content: '', commentable_type: 'Category' } }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new comment' do
        expect do
          post :create, params: { category_id: category.id, comment: valid_comment_params }
        end.to change(Comment, :count).by(1)
      end

      it 'redirects to the commentable object' do
        post :create, params: { category_id: category.id, comment: valid_comment_params }
        expect(response).to redirect_to(category)
        expect(flash[:notice]).to eq('Comment added successfully.')
      end
    end

    context 'with invalid params' do
      it 'does not create a comment' do
        expect do
          post :create, params: { category_id: category.id, comment: invalid_comment_params }
        end.to_not change(Comment, :count)
      end

      it 'redirects to the commentable object with an alert' do
        post :create, params: { category_id: category.id, comment: invalid_comment_params }
        expect(response).to redirect_to(category)
        expect(flash[:alert]).to eq("Comment can't be empty or have more that 140 symbols")
      end
    end
  end
end
