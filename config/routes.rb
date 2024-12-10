Rails.application.routes.draw do
  root "pages#home"
  devise_for :admins, controllers: {
    sessions: "admin/sessions"

  }
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :categories do
    resources :images, only: [ :new, :create, :show ]
    resources :comments, only: [ :create ]
  end

  resources :images do
    resource :like, module: :images
  end

  resources :users, only: [ :show ]


  get "up" => "rails/health#show", as: :rails_health_check
end
