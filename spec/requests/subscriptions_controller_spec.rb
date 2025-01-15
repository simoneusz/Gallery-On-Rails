require 'rails_helper'

RSpec.describe SubscriptionsController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: create(:user)) }

  before do
    sign_in user
  end

  describe 'POST #create' do
    context 'when subscription is successful' do
      it 'creates a subscription for the category' do
        expect do
          post :create, params: { category_id: category.id }
        end.to change(Subscription, :count).by(1)

        expect(response).to redirect_to(category_path(category))
        expect(flash[:notice]).to eq('You have subscribed to this category.')
      end
    end

    context 'when subscription fails' do
      before do
        allow_any_instance_of(Subscription).to receive(:save).and_return(false)
        allow_any_instance_of(Subscription).to receive_message_chain(:errors,
                                                                     :full_messages).and_return(['Error occurred'])
      end

      it 'does not create a subscription and shows an error' do
        expect do
          post :create, params: { category_id: category.id }
        end.not_to change(Subscription, :count)

        expect(response).to redirect_to(category_path(category))
        expect(flash[:alert]).to eq('Error occurred')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when unsubscribing is successful' do
      let!(:subscription) { create(:subscription, user: user, category: category) }

      it 'destroys the subscription' do
        expect do
          delete :destroy, params: { category_id: category.id }
        end.to change(Subscription, :count).by(-1)

        expect(response).to redirect_to(category_path(category))
        expect(flash[:notice]).to eq('You have unsubscribed from this category.')
      end
    end

    context 'when unsubscribing fails (subscription not found)' do
      it 'does not destroy any subscriptions and shows an error' do
        expect do
          delete :destroy, params: { category_id: category.id }
        end.not_to change(Subscription, :count)

        expect(response).to redirect_to(category_path(category))
        expect(flash[:alert]).to eq('You are not subscribed to this category.')
      end
    end
  end
end
