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
    resources :images, only: [ :new, :create, :show, :destroy ]
  end
  resources :users, only: [ :show ] do
    resources :categories do
      resources :images, only: [ :new, :create, :show, :destroy ]
    end
  end


  get "up" => "rails/health#show", as: :rails_health_check
end
