Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }, path_names: { edit: 'profile' }

  resources :categories, only: %i[new create show index destroy update] do
    resources :images, only: %i[new create show]
    resources :comments, only: [:create]
    resource :subscription, only: %i[create destroy]
  end
  resources :images do
    resources :comments, only: [:create]
    resource :like, module: :images
  end
  resources :notifications, only: %i[index update] do
    member do
      patch :mark_as_read
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
