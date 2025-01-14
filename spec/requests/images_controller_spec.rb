require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }
  let(:other_user) { create(:user) }
  let(:valid_image_params) { { title: 'Test Image', image: fixture_file_upload(Rails.root.join('spec/fixtures/test_image.jpg'), 'image/png') } }
  let(:invalid_image_params) { { title: '', image: nil } }

  before do
    sign_in user
  end

  describe 'GET #new' do
    it 'assigns a new image to @image' do
      get :new, params: { category_id: category.id }
      expect(assigns(:image)).to be_a_new(Image)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new image' do
        expect {
          post :create, params: { category_id: category.id, image: valid_image_params }
        }.to change(Image, :count).by(1)
      end

      it 'redirects to the category show page with a notice' do
        post :create, params: { category_id: category.id, image: valid_image_params }
        expect(response).to redirect_to(category_path(category))
        expect(flash[:notice]).to eq('Image successfully uploaded.')
      end
    end

    context 'with invalid params' do
      it 'does not create a new image' do
        expect {
          post :create, params: { category_id: category.id, image: invalid_image_params }
        }.to_not change(Image, :count)
      end

      it 're-renders the new image page with an error' do
        post :create, params: { category_id: category.id, image: invalid_image_params }
        expect(response).to render_template(:new)
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'GET #show' do
    let(:image) { create(:image, category: category, user: user) }

    it 'assigns the requested image to @image' do
      get :show, params: { category_id: category.id, id: image.id }
      expect(assigns(:image)).to eq(image)
    end
  end

  describe 'Authorization' do
    context 'when the user is not authorized' do
      before do
        sign_in other_user
      end

      it 'redirects to the root path with an alert' do
        post :create, params: { category_id: category.id, image: valid_image_params }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq('You are not authorized to add images to this category.')
      end
    end
  end

  context 'when not authenticated' do
    before { sign_out user }

    it 'redirects to the login page when not authenticated' do
      get :new, params: { category_id: category.id }
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'redirects to the login page when attempting to create an image' do
      post :create, params: { category_id: category.id, image: valid_image_params }
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
