Rails.application.routes.draw do
  root 'products#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :products
  resources :categories, except: :show
  # resources :cart, only: :show
  get 'cart', to: 'cart#show'

  post 'cart/add'
  post 'cart/remove'

  get 'categories/:id/products', to: 'categories#show', as: :category_products

  get 'products', to: 'products#index'

  get 'products/new', to: 'products#new'

  post 'products', to: 'products#create'
end
