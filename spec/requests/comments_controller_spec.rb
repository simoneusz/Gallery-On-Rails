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
        expect {
          post :create, params: { category_id: category.id, comment: valid_comment_params }
        }.to change(Comment, :count).by(1)
      end

      it 'redirects to the commentable object' do
        post :create, params: { category_id: category.id, comment: valid_comment_params }
        expect(response).to redirect_to(category)
        expect(flash[:notice]).to eq('Comment added successfully.')
      end

      # it 'creates an activity log' do
      #   p :comment
      #   p "ActivityLog.count: #{ActivityLog.count}"
      #   expect {
      #     post :create, params: { category_id: category.id, user_id: user.id,  comment: valid_comment_params }
      #   }.to change(ActivityLog, :count).by(1)
      #   p "ActivityLog.count: #{ActivityLog.count}"
      # end
    end

    context 'with invalid params' do
      it 'does not create a comment' do
        expect {
          post :create, params: { category_id: category.id, comment: invalid_comment_params }
        }.to_not change(Comment, :count)
      end

      it 'redirects to the commentable object with an alert' do
        post :create, params: { category_id: category.id, comment: invalid_comment_params }
        expect(response).to redirect_to(category)
        expect(flash[:alert]).to eq('Comment cannot be empty.')
      end
    end
  end


  context 'when not authenticated' do
    before { sign_out user }

    it 'redirects to the login page when not authenticated' do
      get :create, params: { category_id: category.id }
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
