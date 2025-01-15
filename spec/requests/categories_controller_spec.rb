require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }
  let!(:category) { create(:category, user: user) }
  let(:valid_attributes) { { title: 'Test Category', description: 'Test Description', image: nil } }
  let(:invalid_attributes) { { title: '', description: '' } }

  before do
    sign_in user
  end

  describe 'GET #index' do
    subject { get :index }
    it 'assigns all categories as @categories' do
      subject
      expect(assigns(:categories)).to eq([category])
    end
  end

  describe 'GET #show' do
    subject { get :show, params: { id: category.id, page: 1 } }
    before { create_list(:image, 6, category: category) }

    it 'assigns the requested category as @category' do
      subject
      expect(assigns(:category)).to eq(category)
    end

    it 'paginates images associated with the category' do
      subject
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
    subject { post :create, params: { category: valid_attributes } }
    context 'with valid parameters' do
      it 'creates a new category' do
        expect { subject }.to change(Category, :count).by(1)
      end

      it 'redirects to the created category' do
        subject
        expect(response).to redirect_to(Category.last)
      end
    end
  end

  describe 'POST #create' do
    subject { post :create, params: { category: invalid_attributes } }
    context 'with invalid parameters' do
      it 'does not create a new category' do
        expect { subject }.not_to change(Category, :count)
      end

      it 'renders the new template with unprocessable_entity status' do
        subject
        expect(response).to render_template(:new)
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the requested category' do
        patch :update, params: { id: category.id, category: { title: 'Updated Title' } }
        expect(category.reload.title).to eq('Updated Title')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the category' do
        patch :update, params: { id: category.id, category: invalid_attributes }
        expect(category.reload.title).not_to eq('')
      end

      it 'renders a JSON response with errors' do
        patch :update, params: { id: category.id, category: invalid_attributes }
        expect(JSON.parse(response.body)).to include('success' => false, 'errors' => a_kind_of(Array))
      end
    end
  end

  describe 'DELETE #destroy' do
    subject { category }
    it 'destroys the requested category' do
      expect do
        delete :destroy, params: { id: category.id }
      end.to change(Category, :count).by(-1)
    end

    it 'redirects to the categories list' do
      delete :destroy, params: { id: category.id }
      expect(response).to redirect_to(categories_path)
    end
  end
end
