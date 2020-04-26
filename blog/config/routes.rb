Rails.application.routes.draw do
  # devise_for :users
  # get 'welcome/index'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  #///////////////////////////////////////////////////////////////////////////////////////////////

  #welcome controllers
  # map requests to http://localhost:3000/welcome/index to the welcome controller's index action.
  get 'welcome/index'

  #map requests to the root of the application to the welcome controller's index action
  root 'welcome#index' 
  #////////////////////////////////////////////////////////////////////////////////////////////////
  #article controller
  resources :articles

  #comments routs 
  resources :articles do
  resources :comments
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
