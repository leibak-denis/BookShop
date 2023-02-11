Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :products
  resources :categories, excect: :show
  get 'cart', to: 'cart#show'

  post 'cart/add'
  post 'cart/remove'
  get 'cart/temp', to: 'cart#temp'

  get 'categories/:id/products', to: 'categories#show', as: 'category_path'

  get 'products', to: 'products#index'

  get 'products/new', to: 'products#new'

  post 'products', to: 'products#create'

  root 'products#index'
end
