Rails.application.routes.draw do

  root to: 'home#index'
  get 'home/private', to: 'home#private', as: 'home_private'

  devise_for :users
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
