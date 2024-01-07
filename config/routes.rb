Rails.application.routes.draw do
  get 'users/show'
  resources :rooms do
    resources :messages
  end

  root "rooms#index"

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  devise_scope :user do
    get 'users', to: 'devise/sessions#new'
  end

  get 'user/:id', to: 'users#show', as: 'user'
  get "up" => "rails/health#show", as: :rails_health_check
end