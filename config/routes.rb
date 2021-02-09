Rails.application.routes.draw do
  devise_for :users
  root to: "orders#index"
  resources :orders, only: [:index, :new, :create, :create, :edit, :delete, :show]
  resources :customers, only: [:index, :new, :create, :edit, :delete, :show]
end
