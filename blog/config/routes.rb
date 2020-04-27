Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :users, only: [:new, :create]   
  get 'login', to: 'sessions#new'   
  post 'login', to: 'sessions#create'   
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  #welcome controllers
  # map requests to http://localhost:3000/welcome/index to the welcome controller's index action.
  # get 'welcome/index'

  #map requests to the root of the application to the welcome controller's index action
  root 'welcome#index' 
  #////////////////////////////////////////////////////////////////////////////////////////////////
  #article controller
  # resources :articles

  #comments routs 
  resources :articles do
  resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
