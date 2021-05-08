Rails.application.routes.draw do
  devise_for :users
  root to: "orders#index"
  resources :customers do
    resources :ship_addresses
  end
  resources :orders do
    collection do
      get 'items_search'
    end
  end  
  resources :add_orders do
    collection do
      get 'items_search'
    end
  end  
  
  resources :items   
end
