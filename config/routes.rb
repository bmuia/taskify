Rails.application.routes.draw do
  resources :tasks
  root "dashboard#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
