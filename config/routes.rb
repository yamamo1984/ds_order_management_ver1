Rails.application.routes.draw do
  devise_for :users
  root to: "orders#index"
  resources :orders, only: [:index, :new, :create, :edit, :update, :delete, :show]
  resources :customers, only: [:index, :new, :create, :edit, :update, :delete, :show]
end
