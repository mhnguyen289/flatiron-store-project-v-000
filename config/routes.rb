Rails.application.routes.draw do

  
  

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  
  resources :carts
  resources :line_items, only: [:create]
  resources :orders, only: [:show]
  devise_for :users
  root 'store#index', as: 'store'

  post 'carts/:id/checkout', to: 'carts#checkout', as: 'checkout'

end
