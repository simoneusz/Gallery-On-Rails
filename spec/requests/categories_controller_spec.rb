require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }
  let(:valid_attributes) { { title: 'Test Category', description: 'Test Description', image: nil } }
  let(:invalid_attributes) { { title: '', description: '' } }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all categories as @categories' do
      category
      get :index
      expect(assigns(:categories)).to eq([ category ])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested category as @category' do
      get :show, params: { id: category.id }
      expect(assigns(:category)).to eq(category)
    end

    it 'paginates images associated with the category' do
      images = create_list(:image, 6, category: category)
      images.size
      get :show, params: { id: category.id, page: 1 }
      expect(assigns(:images).size).to eq(5)
    end
  end

  describe 'GET #new' do
    it 'assigns a new category as @category' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new category' do
        expect {
          post :create, params: { category: valid_attributes }
        }.to change(Category, :count).by(1)
      end

      it 'redirects to the created category' do
        post :create, params: { category: valid_attributes }
        expect(response).to redirect_to(Category.last)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new category' do
        expect {
          post :create, params: { category: invalid_attributes }
        }.not_to change(Category, :count)
      end

      it 'renders the new template with unprocessable_entity status' do
        post :create, params: { category: invalid_attributes }
        expect(response).to render_template(:new)
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the requested category' do
        patch :update, params: { id: category.id, category: { title: 'Updated Title' } }
        category.reload
        expect(category.title).to eq('Updated Title')
      end

      it 'renders a JSON response with success: true' do
        patch :update, params: { id: category.id, category: { title: 'Updated Title' } }
        expect(JSON.parse(response.body)).to eq({ 'success' => true })
      end
    end

    context 'with invalid parameters' do
      it 'does not update the category' do
        patch :update, params: { id: category.id, category: invalid_attributes }
        category.reload
        expect(category.title).not_to eq('')
      end

      it 'renders a JSON response with errors' do
        patch :update, params: { id: category.id, category: invalid_attributes }
        expect(JSON.parse(response.body)).to include('success' => false, 'errors' => a_kind_of(Array))
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested category' do
      category
      expect {
        delete :destroy, params: { id: category.id }
      }.to change(Category, :count).by(-1)
    end

    it 'redirects to the categories list' do
      delete :destroy, params: { id: category.id }
      expect(response).to redirect_to(categories_path)
    end
  end
end
