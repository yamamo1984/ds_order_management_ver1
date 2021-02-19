Rails.application.routes.draw do
  devise_for :users
  root to: "orders#index"
  resources :customers
  resources :orders
  resources :items
end
