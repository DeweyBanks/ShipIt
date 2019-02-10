Rails.application.routes.draw do

  root 'home#index'
  resources :vendors
  resources :orders
  resources :shipments
end
