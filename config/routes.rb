Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :about, only: [:index]
  resources :product, only: [:index, :show] do 
  	member do 
  		post :add_to_cart
  		post :remove_from_cart
  		post :clear_item_from_cart
  	end
  	collection do 
  		post :clear_cart
  	end
  end
  resources :category, only: [:show]
  resources :customer, only: [:new, :create]
  root to: 'product#index'
end
