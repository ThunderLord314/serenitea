Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :about, only: [:index]
  resources :product, only: [:index, :show]
  root to: 'product#index'
end
