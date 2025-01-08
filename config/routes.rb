Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "pages#home"

  devise_for :admins, controllers: {
    sessions: "admin/sessions"

  }
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :categories do
    resources :images, only: [ :new, :create, :show ]
    resources :comments, only: [ :create ]
    resource :subscription, only: [ :create, :destroy ]
  end
  resources :images do
    resource :like, module: :images
  end
  resources :notifications, only: [ :index, :update ]
  resource :profile, only: [ :show ], controller: "users"

  scope "/:locale" do
    get "/", to: "pages#home"
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
