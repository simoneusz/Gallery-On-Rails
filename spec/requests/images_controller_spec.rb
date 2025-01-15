require 'rails_helper'

RSpec.describe ImagesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }
  let(:other_user) { create(:user) }
  let(:valid_image_params) do
    { title: 'Test Image', image: fixture_file_upload(Rails.root.join('spec/fixtures/test_image.jpg'), 'image/png') }
  end
  let(:invalid_image_params) { { title: '', image: nil } }

  before do
    sign_in user
  end

  describe 'GET #new' do
    subject { get :new, params: { category_id: category.id } }
    it 'assigns a new image to @image' do
      subject
      expect(assigns(:image)).to be_a_new(Image)
    end
  end

  describe 'POST #create' do
    subject { post :create, params: { category_id: category.id, image: invalid_image_params } }
    context 'with invalid params' do
      it 'does not create a new image' do
        expect { subject }.to_not change(Image, :count)
      end
      it 're-renders the new image page with an error' do
        subject
        expect(response).to render_template(:new)
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'POST #create' do
    subject { post :create, params: { category_id: category.id, image: valid_image_params } }
    context 'with valid params' do
      it 'creates a new image' do
        expect { subject }.to change(Image, :count).by(1)
      end
      it 'redirects to the category show page with a notice' do
        subject
        expect(response).to redirect_to(category_path(category))
        expect(flash[:notice]).to eq('Image successfully uploaded.')
      end
    end
  end

  describe 'GET #show' do
    let(:image) { create(:image, category: category, user: user) }
    subject { get :show, params: { category_id: category.id, id: image.id } }
    it 'assigns the requested image to @image' do
      subject
      expect(assigns(:image)).to eq(image)
    end
  end

  describe 'Authorization' do
    subject { post :create, params: { category_id: category.id, image: valid_image_params } }
    context 'when the user is not authorized' do
      before do
        sign_in other_user
      end

      it 'redirects to the root path with an alert' do
        subject
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq('You are not authorized to add images to this category.')
      end
    end
  end
end
