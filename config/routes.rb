Rails.application.routes.draw do
  devise_for :users
  root to: "orders#index"
  resources :customers
  resources :orders do
    resources :ship_addresses
  end  
  resources :items
end
