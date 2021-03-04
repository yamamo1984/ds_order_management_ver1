Rails.application.routes.draw do
  devise_for :users
  root to: "orders#index"
  resources :customers do
    resources :ship_addresses
  end
  resources :orders
  resources :add_orders 
  
  resources :items
end
