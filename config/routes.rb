Rails.application.routes.draw do
  root "pages#home"
  # get "images/show"
  # get "images/create"
  # get "images/destroy"
  # resources :categories
  devise_for :admins, controllers: {
    sessions: "admin/sessions"

  }
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :users, only: [ :show ] do
    resources :categories
  end


  get "up" => "rails/health#show", as: :rails_health_check
end
