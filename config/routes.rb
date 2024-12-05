Rails.application.routes.draw do
  resources :users, only: [ :show ]
  devise_for :admins, controllers: {
    sessions: "admin/sessions",
    registration: "admin/registration"
  }
  devise_for :users, controllers: {
    sessions: "users/sessions"
  }

  root "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
end
