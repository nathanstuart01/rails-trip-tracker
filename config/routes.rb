Rails.application.routes.draw do

  root to: 'home#index'

  post 'signup/create', to: 'signup#create', as: 'signup'
  get 'signup/index', as: 'signupNews'

  devise_for :users, controllers: { :omniauth_callbacks => 'omniauth_callbacks' }
  resources :signups

  resources :users, only: [:create]
  resources :newsletter, only: [:new, :create]
  resources :trips do
    resources :locations
  end

  resources :locations do
    resources :addresses
  end
end
