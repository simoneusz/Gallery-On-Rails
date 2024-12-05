Rails.application.routes.draw do
  get "images/show"
  get "images/create"
  get "images/destroy"
  resources :categories
  devise_for :admins, controllers: {
    sessions: "admin/sessions"

  }
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :users, only: [ :show ]
  root "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
end
