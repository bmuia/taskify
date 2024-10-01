# config/routes.rb
Rails.application.routes.draw do
  resources :tasks

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Define a scope for Devise to handle correct mappings
  devise_scope :user do
    authenticated :user do
      root to: 'dashboard#index', as: :authenticated_root  # This is the root path for authenticated users
      get 'dashboard', to: 'dashboard#index', as: :dashboard # This defines the dashboard_path
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root  # Redirect to login for unauthenticated users
    end
  end

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
