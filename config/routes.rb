Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:show]
  resources :comments, only: [:new, :create]
end
