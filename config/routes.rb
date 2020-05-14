Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profiles'
    post 'profiles', to: 'users/registrations#create_profiles'
  end
  
  root 'items#index'
  resources :credit_cards, only:[:new]
  resources :signup, only: [:new]
  resources :items, only: [:index, :new, :show] do
    resources :buys, only: [:show]
    end
  end

