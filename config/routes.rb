Rails.application.routes.draw do
  devise_for :users
  root to: "orders#index"
  resources :orders
  resources :customers
end
